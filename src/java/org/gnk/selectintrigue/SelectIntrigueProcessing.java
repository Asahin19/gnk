package org.gnk.selectintrigue;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.gnk.gn.Gn;
import org.gnk.roletoperso.Role;
import org.gnk.roletoperso.RoleHasTag;
import org.gnk.tag.Tag;
import org.gnk.tag.TagService;

public class SelectIntrigueProcessing {

	private Gn _gn;
    private Set<Plot> _selectedEvenementialPlotList;
	private Set<Plot> _selectedPlotList;
	private Set<Plot> _lockedPlotList;
	private Set<Plot> _bannedPlotList;
	private Set<Plot> _allPlotList;
	private Map<Tag, Integer> _value;
    private Map<Tag, Integer> _valueEvenemential;
	private Set<Tag> _bannedTagList;

	private Integer _minPip;
	private Integer _maxPip;
	private Integer _currentPip;

	// FIXME Handle Mainstream and Evenemential

	public SelectIntrigueProcessing(Gn parGn, List<Plot> parAllPlotList, Set<Plot> bannedList, Set<Plot> lockedPlot) {
		_gn = parGn;
		_selectedPlotList = new HashSet<Plot>();
        _selectedEvenementialPlotList = new HashSet<Plot>();
		_lockedPlotList = lockedPlot;
		_bannedPlotList = bannedList;
		_allPlotList = new HashSet<Plot>();
		_value = new HashMap<Tag, Integer>(parGn.getGnTags().size());
        _valueEvenemential = new HashMap<Tag, Integer>(parGn.getEvenementialTags().size());
		for (Tag tag : parGn.getGnTags().keySet()) {
			_value.put(tag, 0);
		}
        for (Tag tag : parGn.getEvenementialTags().keySet()) {
            _valueEvenemential.put(tag, 0);
        }
		setBannedTagList();
		for (Plot plot : parAllPlotList) {
			if (plotIsCompatible(plot)) {
				_allPlotList.add(plot);
			}
		}

        _maxPip = _gn.getNbPlayers() * _gn.getPipMax();
        int realMinPip = _gn.getNbPlayers() * _gn.getPipMin();
		_minPip = ((_maxPip - realMinPip) / 2) + realMinPip;//Heuristique pour que R2P soit plus facile derrière.

        _currentPip = 0;

		_allPlotList.removeAll(_bannedPlotList);
		_allPlotList.removeAll(_lockedPlotList);
		_selectedPlotList.addAll(_lockedPlotList);
		selectIntrigue();
        selectEvenementialIntrigues();
	}

	public Set<Plot> getSelectedPlots() {
		return _selectedPlotList;
	}

    public Set<Plot> getSelectedEvenementialPlotList() {
        return _selectedEvenementialPlotList;
    }

	public int getPipByPlayer() {
		return _gn.getNbPlayers() > 0 ? _currentPip / _gn.getNbPlayers() : 0;
	}

	public Map<Tag, Integer> getTagsResult() {
		evaluateGn(true);
		return _value;
	}

	private void selectIntrigue() {
		while (executeRound()) {
		}
	}

    private void selectEvenementialIntrigues() {
        while (selectBestEvenemential()) {
        }
    }

	private int evaluateGn(boolean flush) {
		int result = 0;
		_currentPip = 0;
		if (flush) {
			for (Entry<Tag, Integer> entry : _value.entrySet()) {
				entry.setValue(0);
			}
			for (Plot plot : _selectedPlotList) {
				_currentPip += plot.getSumPipRoles();
				for (Entry<Tag, Integer> entry : _value.entrySet()) {
					if (plot.hasPlotTag(entry.getKey())) {
						entry.setValue(entry.getValue() + plot.getSumPipRoles() * plot.getTagWeight(entry.getKey()));
					}
				}
			}
		}
		for (Entry<Tag, Integer> entry : _value.entrySet()) {
			if (_currentPip > 0) {
				entry.setValue((entry.getValue() / _currentPip)); // On remet
																	// sous
																	// forme de
																	// %age
			}
			int inter = _gn.getGnTags().get(entry.getKey()) - entry.getValue();
			result -= inter * inter;
		}
		return result;
	}

	private int evaluateGnWithPlot(Plot plot) {
		if (_selectedPlotList.contains(plot)) {
			return evaluateGn(false);
		}
		_selectedPlotList.add(plot);
		int result = evaluateGn(true);
		_selectedPlotList.remove(plot);
		return result;
	}

	private void setBannedTagList() {
		// On interdit les plots qui possede un tag pondere negativement dans le
		// GN
		_bannedTagList = new HashSet<Tag>();
		for (Entry<Tag, Integer> plotTagEntry : _gn.getGnTags().entrySet()) {
			if (plotTagEntry.getValue() < 0) {
				_bannedTagList.add(plotTagEntry.getKey());
			}
		}
        for (Entry<Tag, Integer> plotTagEntry : _gn.getEvenementialTags().entrySet()) {
            if (plotTagEntry.getValue() < 0) {
                _bannedTagList.add(plotTagEntry.getKey());
            }
        }
	}

	private boolean plotIsCompatible(Plot plot) {
		// FIXME handle isPublic
        if (plot.getIsDraft())
            return false;
		if (!(plot.hasUnivers(_gn.getUnivers())) && !(plot.isUniversGeneric())) {
			return false;
		}
		for (Tag bannedPlotTag : _bannedTagList) {
			if (plot.hasPlotTag(bannedPlotTag)) {
				return false;
			}
		}
		if (!sexFilter(plot))
			return false;


        final Set<Role> roleList = new HashSet<Role>();

        Set<Role> roleSet = plot.getterRoles();
        assert (roleSet != null);
        if (roleSet == null)
            return false;
        for (Role role : roleSet) {
            if (role.isPJ())
                roleList.add(role);
        }
		if (roleList.size() > _gn.getNbPlayers())
			return false;
		for (Role role : roleList) {
			if ((role.getPipi() + role.getPipr()) > _gn.getPipMax()) {
				return false;
			}
		}
		return true;
	}

	private boolean sexFilter(Plot plot) {
		return ((plot.getNbMinMen() <= _gn.getNbPlayers() - _gn.getNbWomen()) && (plot.getNbMinWomen() <= _gn.getNbPlayers() - _gn.getNbMen()));
	}

	private void selectPlot(Plot plot) {
        if (plot.getIsEvenemential()) {
            _selectedEvenementialPlotList.add(plot);
        }
        else {
            _selectedPlotList.add(plot);
        }
		_allPlotList.remove(plot);
	}

    private boolean selectBestEvenemential() {
        Plot bestPlot = null;
        if (_allPlotList.size() == 0) {
            return false;
        }
        TagService tagService= new TagService();
        Map<Tag, Boolean> emptyMap = new HashMap<Tag, Boolean>();
        Map<Tag, Integer> challengerTagList = new HashMap<Tag, Integer>();
        Integer bestRankTag = 0;
        for (Plot plot : _allPlotList) {
            Set<PlotHasTag> plotHasTags = plot.getExtTags();
            if (plotHasTags != null) {
                for (PlotHasTag plotHasTag : plotHasTags) {
                    challengerTagList.put(plotHasTag.getTag(), plotHasTag.getWeight());
                }
            }
            int rankTag = tagService.getTagsMatching(_valueEvenemential, challengerTagList, emptyMap);
            if (rankTag >= bestRankTag) {
                bestRankTag = rankTag;
                bestPlot = plot;
            }
        }
        selectPlot(bestPlot);
        return true;
    }

	private boolean executeRound() {
		Plot selectedPlot = null;
		Integer newValue = null;
		if (_allPlotList.isEmpty()) {
			return false;
		}
		evaluateGn(true);
		for (Plot plot : _allPlotList) {
            if (!plot.getIsEvenemential()) {
                if ((plot.getSumPipRoles() <= (_maxPip - _currentPip))) {
                    Integer tmpValue = evaluateGnWithPlot(plot);
                    if (newValue == null || tmpValue > newValue) {
                        selectedPlot = plot;
                        newValue = tmpValue;
                    }
                }
                evaluateGn(true);
            }
		}
		if (selectedPlot == null) {
			return false;
		}
		selectPlot(selectedPlot);
		return (_currentPip < _minPip);
	}
}
