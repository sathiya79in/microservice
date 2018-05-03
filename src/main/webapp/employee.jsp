<html>
<head>
<link rel="stylesheet" type="text/css" href="/microservice/css/bootstrap.min.css"/>
<script src="/microservice/js/angular.min.js"></script>
</head>
<body ng-app="Poc"  ng-controller="PocController">

<form>
<div class="row">
<div class="col-sm-8 offset-sm-2" style="border:1px solid #ced4da;">
<div class="form-group row">
    <div class="col-sm-4 offset-sm-4" style="text-align:center;"><label><h2>Employee</h2></label>
    </div>
  </div>
  <div class="form-group row">
    <label for="companyId" class="col-sm-2 col-form-label">Company</label>
    <div class="col-sm-10">
      <select ng-model="companyId" id="companyId">
      	<option value="">Select the Company</option>
      	<option ng-repeat="c in company" value={{c.companyId}}>{{c.name}}</option>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="firstName" placeholder="First Name" ng-model="firstName">
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="lastName" placeholder="Last Name" ng-model="lastName">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-2 offset-sm-5" style="text-align:center;">
  		<button type="button" class="btn btn-primary" ng-click="save()">Save</button>
    </div>
  </div>

    <div class="form-group row" id="output" ng-show="showOutput===true">
    <div class="col-sm-8 offset-sm-2" style="text-align:center;">
  		{{output}}
    </div>
  </div>
  
  </div>
  </div>
  </form>

</body>
<script>
var app = angular.module('Poc', []);
app.controller('PocController', function($scope, $http,$q) {
	
	$scope.showOutput=false;
	$scope.output="";
	$scope.employee=[];
	$scope.plan=[];
	$scope.template=[];
	
	$scope.save=function(){
		var req = {
			'method' : 'POST',
			'url' :'/microservice/employee',
			'data' : {
				'firstName': $scope.firstName,
				'lastName': $scope.lastName,
				'companyId':$scope.companyId		
			}
		};
		
		$http(req).then(function(response) {
        	$scope.showOutput=true;
			$scope.output=response.data;
    	});
	};
	
	function init(){
	 $q.all({
            company: $http.get('http://microservice-microservice.b9ad.pro-us-east-1.openshiftapps.com/microservice/company/all')
          }).then(function(results) {
          	$scope.company=results.company.data;
          });
	}
	init();
});
</script>
</html>
