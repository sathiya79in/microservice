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
    <div class="col-sm-4 offset-sm-4" style="text-align:center;"><label><h2>Equity Plan</h2></label>
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-sm-2 col-form-label">Plan Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" placeholder="Plan Name" ng-model="name">
    </div>
  </div>
  <div class="form-group row">
    <label for="beginDate" class="col-sm-2 col-form-label">Begin Date</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="beginDate" placeholder="Begin Date" ng-model="beginDate">
    </div>
  </div>
  <div class="form-group row">
    <label for="expirationDate" class="col-sm-2 col-form-label">Expiration Date</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="expirationDate" placeholder="Expiration Date" ng-model="expirationDate">
    </div>
  </div>
    <div class="form-group row">
    <label for="allocatedShares" class="col-sm-2 col-form-label">Allocate Shares</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="allocatedShares" placeholder="Allocate Shares" ng-model="allocatedShares">
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
			'url' :'/microservice/plan',
			'data' : {
				'name': $scope.name,
				'beginDate': $scope.beginDate,
				'expirationDate':$scope.expirationDate,
				'allocatedShares': $scope.allocatedShares
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
