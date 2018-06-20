<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<style type="text/css">
span
{
font-size: 10px;
color: red;
font-weight: bold;
}

</style>
</head>
<body  ng-controller="myCtrl">
<div class="container" style="margin-top: 10%;">
            <form  role="form" name="myForm">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
				
					<div class="panel panel-info">
						<div class="panel-body">
				<center><h4>Registration Form</h4></center>		 
                <div class="row">
                <div class="col-md-6">
                 <div class="form-group">
               
                    <label>Full Name</label><span ng-if="myForm.myInput.$invalid">*</span>
                     <input name="myInput" ng-model="app.name" required class="form-control input-sm">
                     
                   
                </div>
                </div>
                 <div class="col-md-6">
                 <div class="form-group">
                    <label>Email </label> <span ng-if="myForm.email.$invalid" >*</span>
                        <input type="email" id="email" placeholder="Email" class="form-control input-sm" name="email"  ng-model="app.email" required>
                    
                </div>
                </div>
                </div>
                
                 <div class="row">
                <div class="col-md-6">
                       <div class="form-group">
                    <label>Phone no</label> <span ng-if="myForm.phone.$invalid">*</span>     
                        <input type="number" id="password" placeholder="phone no" class="form-control input-sm" name="phone" ng-minlength="10"  ng-maxlength="10" ng-model="app.mobile"  required>
                    
                </div>
                </div>
                
                 <div class="col-md-6">
                    <div class="form-group">
                    <label >Date of Birth</label><span ng-if="myForm.date.$invalid">*</span>
                     <input type="date" id="birthDate" class="form-control input-sm"  name="date" required  ng-model="app.dob" ng-change="validate()"  >
                  {{newdate}}
                </div>
                </div>
                </div>
                
                  <div class="row">
                <div class="col-md-6">
                       <div class="form-group">        
                       <button type="submit" class="btn btn-primary btn-block btn-sm" ng-click="save()" ng-disabled="!myForm.phone.$valid">Register</button>
                    
                </div>
                </div>
                
                
                </div>
						
						</div>
					</div>

				</div>

			</div>

         
               
            </form> <!-- /form -->
        </div> <!-- ./container -->
        <script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {

 
$scope.validate=function()
{

var dates=$scope.app.dob;

var newdates=new Date();

var testst=newdates.getFullYear()-dates.getFullYear();


if(testst>="18")
{

}
else
{
alert("Age must be 18")
$scope.app=null;
}
console.log(dates.getFullYear())

}

$scope.save=function()
{

var data1=$scope.app;
 $http({
    method : "POST",
    url : "/test/save",
    data:data1
  }).then(function mySuccess(response) {
      $scope.myWelcome = response.data.status;
      if($scope.myWelcome=="success")
      {
      alert("success")
      $scope.app=null;
      }
      else
      {
      alert("Something Went Wrong")
      }
    }, function myError(response) {
      $scope.myWelcome = response.statusText;
  });
  
}

});
</script>
</body>
</html>