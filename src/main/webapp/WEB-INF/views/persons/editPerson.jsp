<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

      <%@include file="../dynamic/navigationMain.jspf"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>



          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>




            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">User name</span>
               
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <form name="send" method="post" action='<c:url value="/personList/${person.id}"/>'>
                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-12 col-md-12 mb-12">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class="form-group row">
                                    <label for="firstName" class="col-2 col-form-label">Name</label>
                                    <div class="col-10">
                                        <input class="form-control" id="firstName" value="${person.firstName}" type="text"
                                               name="firstName" value="Name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lastName" class="col-2 col-form-label">Surname</label>
                                    <div class="col-10">
                                        <input class="form-control" id="lastName" value="${person.lastName}" type="text"
                                               name="lastName" value="Surname">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="github" class="col-2 col-form-label">URL Git</label>
                                    <div class="col-10">
                                        <input class="form-control" id="github" value="${person.github}" type="text"
                                               name="github" value="github">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="start" class="col-2 col-form-label">When did it all start?</label>
                                    <div class="col-10">
                                            <textarea class="form-control" name="start" id="start"
                                                      rows="5">${person.start}</textarea>
                                    </div>
                                </div>



                                <div class="form-group row">
                                    <label for="checkbox" class="col-2 col-form-label">Did user learn some technologies?</label>
                                    <div class="col-1">
                                        <label class="radio-inline"><input type="radio" id="checkbox" name="checkbox" value="1"<c:if test="${person.checkbox eq '1'}">checked</c:if>>Yes
                                        </label>
                                    </div>
                                    <div class="col-1">
                                        <label class="radio-inline"><input type="radio" name="checkbox" value="0" <c:if test="${person.checkbox eq '0'}">checked</c:if>>No</label>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>


                    <c:if test="${person.checkbox eq '0'}">
                        <input type="hidden" value="${person.java}" name="java">
                        <input type="hidden" value="${person.bestPractice}" name="bestPractice">
                        <input type="hidden" value="${person.tdd}" name="tdd">
                        <input type="hidden" value="${person.question}" name="question">
                        <input type="hidden" value="${person.hibernate}" name="hibernate">
                        <input type="hidden" value="${person.html}" name="html">
                        <input type="hidden" value="${person.jsp}" name="jsp">
                        <input type="hidden" value="${person.thymeleaf}" name="thymeleaf">
                        <input type="hidden" value="${person.git}" name="git">

                    </c:if>

                    <c:if test="${person.checkbox eq '1'}">
                        <!-- Content Row -->

                        <div class="col-xl-12 col-md-12 mb-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">

                                    <div class="row">
                                        <div class="col-2">
                                            <label for="1" class="col-form-label">Java</label>
                                            <input class="form-control" name="java" type="text" value="${person.java}">
                                        </div>


                                        <div class="col-2">
                                            <label for="1" class="col-form-label">Design patterns </label>
                                            <input class="form-control" name="bestPractice" type="text" value="${person.bestPractice}">
                                        </div>


                                        <div class="col-2">
                                            <label for="1" class="col-form-label">TDD</label>
                                            <input class="form-control" name="tdd" type="text" value="${person.tdd}">
                                        </div>


                                        <div class="col-2">
                                            <label for="1" class="col-form-label">SQL</label>
                                            <input class="form-control" name="question" type="text" value="${person.question}">
                                        </div>



                                        <div class="col-2">
                                            <label for="1" class="col-form-label">Hibernate JPA</label>
                                            <input class="form-control" name="hibernate" type="text" value="${person.hibernate}">
                                        </div>


                                        <div class="col-2">
                                            <label for="1" class="col-form-label">HTML_CSS</label>
                                            <input class="form-control" name="html" type="text" value="${person.html}">
                                        </div>


                                        <div class="col-2">
                                            <label for="1" class="col-form-label">JSP</label>
                                            <input class="form-control" name="jsp" type="text" value="${person.jsp}">
                                        </div>

                                        <div class="col-2">
                                            <label for="1" class="col-form-label">Thymeleaf</label>
                                            <input class="form-control" name="thymeleaf" type="text" value="${person.thymeleaf}">
                                        </div>

                                        <div class="col-2">
                                            <label for="1" class="col-form-label">git</label>
                                            <input class="form-control" name="git" type="text" value="${person.git}">
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:if>

                </div>
                <input class="btn btn-success pull-left" type="submit" value="Save changes" id="searchButton"></input>


                <!-- Button to Open the Modal -->
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                    Delete
                </button>
            </form>

               
                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                           
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Are you sure that you want to remove the user?</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    User will be deleted
                                </div>

                            <form name="send" method="post" action='<c:url value="/editPerson/${person.id}"/>'>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-danger pull-left" value="Yes"/>
                                </div>
                            </form>
                        </div>
                   
                    </div>
                </div>

         

    

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

        <%@include file="../dynamic/board.jspf"%>
        <%@include file="../dynamic/js.jspf"%>

</body>

</html>
