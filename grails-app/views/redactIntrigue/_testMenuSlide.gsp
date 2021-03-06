<link rel="stylesheet" href="<g:resource dir="css" file="testMenuSlide.css"/>" type="text/css">
<section id="article27" class="crayon article-css-27 demoTime">
    <div class="pull-right autorField">
        ${plotInstance.user.firstname} ${plotInstance.user.lastname}
    </div>
    <div id="demoWrap">
        <div id="wrap1">
        <div id="wrap2">
        <div id="wrap3">
        <div id="wrap4">
        <div id="wrap5">
        <div id="wrap6">
        <div id="wrap7">
        <div id="wrap8">
            <div id="background">
                <ul class="wrapUl">
                    <li class="wrapLi plotLi">
                        <a class="wrapLink" href="#wrap1" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.plot" default="Plot"/>
                            </span>
                        </a>
                    </li>
                    <li class="wrapLi roleLi">
                        <a class="wrapLink" href="#wrap2" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.roles" default="Roles"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse">${plotInstance.roles.size()}</span>
                    </li>
                    <li class="wrapLi placeLi">
                        <a class="wrapLink" href="#wrap3" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.places" default="Places"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse">${plotInstance.genericPlaces.size()}</span>
                    </li>
                    <li class="wrapLi resourceLi">
                        <a class="wrapLink" href="#wrap4" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.objects" default="Resources"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse">${plotInstance.genericResources.size()}</span>
                    </li>
                    <li class="wrapLi relationLi">
                        <a class="wrapLink" href="#wrap5" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.relations" default="Relations"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse numberRelation">?</span>
                    </li>
                    <li class="wrapLi pastScenesLi">
                        <a class="wrapLink" href="#wrap6" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.pastScenes" default="Past Scenes"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse">${plotInstance.pastescenes.size()}</span>
                    </li>
                    <li class="wrapLi eventsLi">
                        <a class="wrapLink" href="#wrap7" onclick="bgenScroll();">
                            <span>
                                <g:message code="redactintrigue.tabs.events" default="Events"/>
                            </span>
                        </a>
                        <span class="badge badge-inverse">${plotInstance.events.size()}</span>
                    </li>
                </ul>

                <div id="fleche"></div>

                <div id="textes">
                    <div class="container">
                        <g:render template="generalDescriptionForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="rolesForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="placesForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="resourcesForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="relationsForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="pastScenesForm" model="['right':right]"/>
                    </div>

                    <div class="container">
                        <g:render template="eventsForm" model="['right':right]"/>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
        </div>
    </div>
</section>