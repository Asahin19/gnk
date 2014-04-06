<script language="JavaScript" type="text/javascript">

function bgenScroll() {
     if (window.pageYOffset!= null){
      st=window.pageYOffset+'';
     }
     if (document.body.scrollWidth!= null){
      if (document.body.scrollTop){
      st=document.body.scrollTop;
      }
      st=document.documentElement.scrollTop;
     }
      setTimeout('window.scroll(0,st)',10);
}
</script>
<link rel="stylesheet" href="<g:resource dir="css" file="testMenuSlide.css" />" type="text/css">
<section id="article27" class="crayon article-css-27 demoTime">
    <div id="demoWrap">
        <div id="wrap1">
            <div id="wrap2">
                <div id="wrap3">
                    <div id="wrap4">
                        <div id="wrap5">
                            <div id="background">
                                <ul class="wrapUl">
                                    <li class="wrapLi"><a class="wrapLink" href="#wrap1" onclick="bgenScroll();">
                                        Roles
                                    </a></li>
                                    <li class="wrapLi"><a class="wrapLink" href="#wrap2" onclick="bgenScroll();">
                                        Lieux
                                    </a></li>
                                    <li class="wrapLi"><a class="wrapLink" href="#wrap3" onclick="bgenScroll();">
                                        Objets
                                    </a></li>
                                    <li class="wrapLi"><a class="wrapLink" href="#wrap4" onclick="bgenScroll();">
                                        Relations
                                    </a></li>
                                    <li class="wrapLi"><a class="wrapLink" href="#wrap5" onclick="bgenScroll();">
                                        Rédaction
                                    </a></li>
                                </ul>
                                <div id="fleche"></div>
                                <div id="textes">
                                    <div class="container">
                                        <g:render template="rolesForm" />
                                    </div>
                                    <div class="container">
                                        Lieux
                                    </div>
                                    <div class="container">
                                        Objets
                                    </div>
                                    <div class="container">
                                        Relations
                                        <g:render template="relationsForm" />
                                    </div>
                                    <div class="container">
                                        <g:render template="generalDescriptionForm" />
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