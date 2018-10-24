<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>

<div class="demo-cards mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
    <div class="demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
        <div class="mdl-color--teal-300 title-card" >
            ${accion}
        </div>
      <c:url var="urlsave" value="${pageContext.request.contextPath}/saveUser" />
      <frm:form modelAttribute="modeloUsuario" method="post" action="${urlsave}" class="formu">
          <frm:input path="idUsuario" type="hidden"/>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <frm:input path="nombres" class="mdl-textfield__input" type="text"/>
          <frm:label path="nombres" class="mdl-textfield__label" for="sample3">Name</frm:label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <frm:input path="apellidos" class="mdl-textfield__input" type="text"/>
          <frm:label path="apellidos" class="mdl-textfield__label" for="sample3">Last name</frm:label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <frm:input path="correo" class="mdl-textfield__input" type="text"/>
          <frm:label path="correo" class="mdl-textfield__label" for="sample3">Email</frm:label>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <frm:input path="nusuario" class="mdl-textfield__input" type="text"/>
          <frm:label path="nusuario" class="mdl-textfield__label" for="sample3">Username</frm:label>
        </div>
        <button id="demo-show-toast" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" type="submit">
            <c:if test="${!empty modeloUsuario.idUsuario}">
                <i class="material-icons">edit</i>
            </c:if>
            <c:if test="${empty modeloUsuario.idUsuario}">
                <i class="material-icons">add</i>
            </c:if>            
        </button>
      </frm:form>     
    </div>
   

</div>
      
      <div class="demo-table mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--8-col">
    <c:if test="${!empty listaUsuario}">
        <table class="mdl-data-table mdl-js-data-table">
          <thead>
            <tr>
              <th class="mdl-data-table__cell--non-numeric">Name</th>
              <th class="mdl-data-table__cell--non-numeric">Email</th>
              <th class="mdl-data-table__cell--non-numeric">Username</th>
              <th class="mdl-data-table__cell--non-numeric">Options</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${listaUsuario}" var="usuario">
                <tr>
                  <td class="mdl-data-table__cell--non-numeric">${usuario.nombres.concat(" ")}${usuario.apellidos}</td>
                  <td class="mdl-data-table__cell--non-numeric">${usuario.correo}</td>
                  <td class="mdl-data-table__cell--non-numeric">${usuario.nusuario}</td>
                  <td class="mdl-data-table__cell--non-numeric">
                      <a href="${pageContext.request.contextPath}/updateUser?id=${usuario.idUsuario}" class="mdl-button mdl-js-button mdl-button--icon">
                        <i class="material-icons">edit</i>
                      </a>
                      <a href="${pageContext.request.contextPath}/deleteUser?id=${usuario.idUsuario}" class="mdl-button mdl-js-button mdl-button--icon">
                        <i class="material-icons">delete</i>
                      </a>
                  </td>
                </tr>
            </c:forEach>
          </tbody>
        </table>
    </c:if>
    <c:if test="${empty listaUsuario}">
        <p style="padding: 32px;">${noresults}</p>
    </c:if>
</div>

<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>
<script>
(function() {
  'use strict';
  window['counter'] = 0;
  var snackbarContainer = document.querySelector('#demo-toast-example');
  var showToastButton = document.querySelector('#demo-show-toast');
  showToastButton.addEventListener('click', function() {
    'use strict';
    var data = {message: 'Cambios guardados. #' + ++counter};
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
  });
}());
</script>