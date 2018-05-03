<html>
<head>
<link rel="stylesheet" type="text/css" href="/microservice/css/bootstrap.min.css"/>
<script src="/microservice/js/angular.min.js"></script>
</head>
<body ng-app="Poc"  ng-controller="PocController">

<form>
<div class="row">
<div class="col-sm-8 offset-sm-2">
<div class="form-group row">
    <div class="col-sm-4 offset-sm-4" style="text-align:center;"><label>Award</label>
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">Employee</label>
    <div class="col-sm-10">
      <select>
      	<option value="">Select an Employee</option>
      	<option ng-repeat="emp in employee" value={{emp.id}}>{{emp.firstname +" " +emp.lastname}}</option>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">Plan</label>
    <div class="col-sm-10">
      <select>
      	<option value="">Select a Plan</option>
      	<option ng-repeat="p in plan" value={{p.planId}}>{{p.name}}</option>
      </select>
    </div>
  </div>
<div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">Vesting Template</label>
    <div class="col-sm-10">
      <select>
      	<option value="">Select a vesting template</option>
      	<option ng-repeat="t in template" value={{t.templateId}}>{{t.templateName}}</option>
      </select>
    </div>
  </div>  
  <div class="form-group row">
    <label for="symbol" class="col-sm-2 col-form-label">Symbol</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="symbol" placeholder="Symbol" ng-model="symbol">
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
			'url' :'/microservice/company',
			'data' : {
				'name': $scope.name,
				'symbol': $scope.symbol
			}
		};
		
		$http(req).then(function(response) {
        	$scope.showOutput=true;
			$scope.output=response.data;
    	});
	};
	
	function init(){
	 $q.all({
            employee: $http.get('http://microservice-microservice.b9ad.pro-us-east-1.openshiftapps.com/microservice/employee/all'),
            plan: $http.get('http://microservice-microservice.b9ad.pro-us-east-1.openshiftapps.com/microservice/plan/all'),
            template: $http.get('http://microservice-microservice.b9ad.pro-us-east-1.openshiftapps.com/microservice/vesttemplate/all')
          }).then(function(results) {
          	$scope.employee=results.employee.data;
          	$scope.plan=results.plan.data;
          	$scope.template=results.template.data;
          });
	}
	init();
});
</script>
</html>
