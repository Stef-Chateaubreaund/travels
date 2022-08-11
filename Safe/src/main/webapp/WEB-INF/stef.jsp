<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
	<!-- Here we have to import the Date class. -->
	<!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- Formatting (like dates) -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!-- form:form -->
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!-- for rendering errors on PUT routes -->
				<%@ page isErrorPage="true" %>

					<!DOCTYPE html>

					<html>

					<head>
						<meta charset="UTF-8" />
						
						<!-- Bootstrap -->
						<!-- CSS only -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
							crossorigin="anonymous" />
						<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
							integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
							crossorigin="anonymous"></script>
						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
							integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
							crossorigin="anonymous"></script>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
						<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
					</head>

					<body>
			
						<div class="container">
					


							<p class="w-100"></p>
							<!-- == table == -->
							<div class="container w-75">
								<h3>Save Travels</h3>
								<table class="table table-striped p-5 " id="fruit_loops">
									<thead>
										<tr>
											<th scope="col" class="h4 text-center">gasto</th>
											<th scope="col" class="h4 text-center">quem vendeu </th>
											<th scope="col" class="h4 text-center">quanto custou</th>
											<th scope="col" class="h4 text-center">acoesssss</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="expense" items="${expenses}">
											<tr>

												<td scope="row">
													<a href="/expenses/showOne/${expense.id}">
														<p class="text-center">
															<c:out value="${expense.name}"></c:out>
														</p>
													</a>
												</td>

												<td scope="row">
													<p class="text-center">
														<c:out value="${expense.vendor}"></c:out>
													</p>
												</td>

												<td scope="row">
													<p class="text-center">
														
														<fmt:formatNumber value="${expense.amount}" type="currency" />
													</p>
												</td>

												<td scope="row">
													<p class="text-center">

														<a href="/expenses/showOne/${expense.id}">view</a>
														<span> | </span>
														<a href="/expenses/update/${expense.id}">edit</a>
														<span> | </span>
														<a href="/expenses/delete/${expense.id}">delete</a>

													</p>
												</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
			

					
						<div
							class="container background-color:red text-light  w-25  border border-info border-5 pb-5 p-3">
							<form:form action="/" method="post" modelAttribute="expense">

								<div class="mb-3">
									<p>
										<form:label path="name">Expense Name</form:label>
										<form:errors path="name" class="text-danger h5" />
										<form:input path="name" class="form-control"
											placeholder="expense name" />
									</p>
								</div>

								<div>
									<p>
										<form:label path="vendor">Vendor</form:label>
										<form:errors path="vendor" />
										<form:input path="vendor" class="form-control" placeholder="vendor" />
									</p>
								</div>

								<div>
									<p>
										<form:label path="amount">Amount</form:label>
										<form:errors path="amount" class="text-danger h5" />
										<form:input type="number" step="0.01" path="amount" class="form-control w-25"
											placeholder="amount" />
									</p>
								</div>

								<div>
									<p>
										<form:label path="description">Description</form:label>
										<form:errors path="description" class="text" />
										<form:textarea path="description" class="form-control"
											placeholder="description" />
									</p>
								</div>

								<input type="submit" value="mais uma :D" class="btnß" />

							</form:form>

						</div>

						<p class="p"></p>



						</div>
						<p class="p"></p>
						
					</body>

					</html>