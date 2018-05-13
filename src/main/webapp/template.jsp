<html>
<head>
<link rel="stylesheet" type="text/css" href="/microservice/css/bootstrap.min.css"/>
<script src="/microservice/js/angular.min.js"></script>
</head>
<body ng-app="Poc"  ng-controller="PocController">

<form>
<div class="row">
<div class="col-sm-8 offset-sm-2"  style="border:1px solid #ced4da;">
<div class="form-group row">
    <div class="col-sm-4 offset-sm-4" style="text-align:center;"><label><h2>Vesting Template</h2></label>
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">Template Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" placeholder="Plan Name" ng-model="templateName">
    </div>
  </div>
  <div class="form-group row">
    <label for="months" class="col-sm-2 col-form-label">Months</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="months" placeholder="Months" ng-model="months">
    </div>
  </div>
  <div class="form-group row">
    <label for="percent" class="col-sm-2 col-form-label">Percent</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="percent" placeholder="Percent" ng-model="percent">
    </div>
  </div>
    <div class="form-group row">
    <label for="vestType" class="col-sm-2 col-form-label">Vest Type</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="vestType" placeholder="vest Type" ng-model="vestType">
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
app.controller('PocController', function($scope, $http) {
	
	$scope.showOutput=false;
	$scope.output="";
	$scope.save=function(){
		var req = {
			'method' : 'POST',
			'url' :'/microservice/template',
			'data' : {
				'templateName': $scope.templateName,
				'months': $scope.months,
				'percent':$scope.percent,
				'vestType': $scope.vestType
			}
		};
		
		$http(req).then(function(response) {
        	$scope.showOutput=true;
			$scope.output=response.data;
    	});
	};
});
</script>
</html>
