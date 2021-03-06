<%@ page import="org.gnk.tag.TagRelation" %>
<%@ page import="org.gnk.tag.Tag" %>

<input type="hidden" id="path" value="<g:resource dir="images/tag" file="true.png"/>"/>
<table class="table table-bordered">
	<thead>
		<tr>
			<th><g:message code="tagRelation.tag1.label" default="Tag1" /></th>
			<th><g:message code="tagRelation.tag2.label" default="Tag2" /></th>
			<g:sortableColumn property="isBijective" title="${message(code: 'tagRelation.isBijective.label', default: 'Is Bijective')}" />		
			<g:sortableColumn property="weight" title="${message(code: 'tagRelation.weight.label', default: 'Weight')}" />	
			<g:sortableColumn property="delete" title="${message(code: 'tagRelation.weight.label', default: ' ')}" />	
		</tr>
	</thead>
	<tbody>
    <g:if test="${trs != null}">
        <g:set var="tagRelations" value="${trs}"/>
    </g:if>
    <g:else>
        <g:set var="tagRelations" value="${TagRelation.list()}"/>
    </g:else>
	<g:each in="${tagRelations}" status="i" var="tagRelationInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><a href="#modalValue${tagRelationInstance.tag1.id}" role="button" class="btn valueButton" data-toggle="modal">${fieldValue(bean: tagRelationInstance, field: "tag1")}</a>
                <input type="hidden" id="idTag1" name="idTag" value="${tagRelationInstance.tag1.id}"></td>
			<td><a href="#modalValue${tagRelationInstance.tag2.id}" role="button" class="btn valueButton" data-toggle="modal">${fieldValue(bean: tagRelationInstance, field: "tag2")}</a>
                <input type="hidden" id="idTag2" name="idTag" value="${tagRelationInstance.tag2.id}"></td>
			<g:form action="updateRelation" id="${tagRelationInstance.id}">
            <td><g:checkBox name="isBijective${tagRelationInstance.id}" value="${tagRelationInstance.isBijective}"/></td>
			<td><input type="number" name="weightRelationTag${tagRelationInstance.id}" value="${tagRelationInstance.weight}"/></td>
            <td>
                <button type="submit" class="btn btn-primary"><g:message code="default.title.update"/></button>
            </td>
            </g:form>
			<td>
               <!-- <a href="#modaledit${tagRelationInstance?.id}" role="button" class="btn" data-toggle="modal">${message(code: 'default.edit')}</a> -->
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="idRelation" value="${tagRelationInstance?.id}" />
                        <g:actionSubmit class="btn btn-warning" action="deleteRelation" value="${message(code: 'default.delete')}" onclick="return confirm('${message(code: 'adminRef.tagRelation.deleteRelation')}');" />
                    </fieldset>
                </g:form>
            </td>
		</tr>
	</g:each>
	</tbody>
</table>
<input type="hidden" name="idTagInformationurl" id="idTagInformationurl" data-url="<g:createLink controller="tag" action="showInformation"/>"/>

<div id="modalViewTag">
</div>
<g:render template="modaleditViewTags" />

<g:javascript src="tag/modalTag.js"/>