<header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
    <div class="mdl-layout__header-row">
      <span class="mdl-layout-title">Home</span>
      
      <div class="mdl-layout-spacer"></div>
      
      <form action="${pageContext.request.contextPath}/searchUser" method="POST" style="margin-bottom: 0em">
      
      <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
        <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
          <i class="material-icons">search</i>
        </label>
        <div class="mdl-textfield__expandable-holder">
          
            <input class="mdl-textfield__input" type="text" name="dato" id="search">
            <label class="mdl-textfield__label" for="search">Enter your query...</label>
          
        </div>
      </div>
          
      </form>
      <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
        <i class="material-icons">more_vert</i>
      </button>
      <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
        <a href="?lang=es"><li class="mdl-menu__item">Español</li></a>
        <a href="?lang=en"><li class="mdl-menu__item">Ingles</li></a>
        <a href="?lang=fr"><li class="mdl-menu__item">Frances</li></a>
      </ul>
    </div>
</header>
