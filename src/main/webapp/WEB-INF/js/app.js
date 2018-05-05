var app = angular.module('Poc', ["ngRoute","angular-json-tree"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "/microservice/html/company.html"
    })
    .when("/company", {
        templateUrl : "/microservice/html/company.html"
    })
    .when("/employee", {
        templateUrl : "/microservice/html/employee.html"
    })
    .when("/template", {
        templateUrl : "/microservice/html/template.html"
    })
	.when("/award", {
        templateUrl : "/microservice/html/award.html"
    })    
    .when("/plan", {
        templateUrl : "/microservice/html/plan.html"
    })
    .when("/view", {
        templateUrl : "/microservice/html/view.html"
    })
    .when("otherwise", {
        templateUrl : "/microservice/html/company.html"
    });
});

angular.module('Poc').controller('PageController', function($scope,$location) {
	var path = $location.path();
		path=path.replace('/','');
	$scope.currentTab=path!=''?path:'company';
	
	$scope.switch= function(tab){
		$scope.currentTab=tab;
	};
	
});

angular.module('Poc').controller('AwardController', function($scope, $http,$q) {
	
	$scope.showOutput=false;
	$scope.output="";
	$scope.employee=[];
	$scope.plan=[];
	$scope.template=[];
	
	$scope.save=function(){
		var req = {
			'method' : 'POST',
			'url' :'/microservice/award',
			'data' : {
				'employeeId': $scope.employeeId,
				'planId': $scope.planId,
				'templateId': $scope.templateId,
				'number':$scope.number,
				'date': $scope.date,
				'marketValue':$scope.marketValue,
				'price':$scope.price,
				'shares':$scope.shares		
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

angular.module('Poc').controller('CompanyController', function($scope, $http) {
	
	$scope.showOutput=false;
	$scope.output="";
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
});

angular.module('Poc').controller('EmployeeController', function($scope, $http,$q) {
	
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
            company: $http.get('/microservice/company/all')
          }).then(function(results) {
          	$scope.company=results.company.data;
          });
	}
	init();
});

angular.module('Poc').controller('PlanController', function($scope, $http) {
	
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

angular.module('Poc').controller('TemplateController', function($scope, $http) {
	
	$scope.showOutput=false;
	$scope.output="";
	$scope.save=function(){
		var req = {
			'method' : 'POST',
			'url' :'/microservice/vesttemplate',
			'data' : {
				'name': $scope.name,
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


angular.module('Poc').controller('ViewController', function($scope, $http) {
	
	$scope.selectedDomain ='';
	
	
	$scope.switch=function(domain){
		var req = {
			'method' : 'GET',
			'url' :('/microservice/'+domain+'/all')
		};
		$scope.selectedDomain=domain;
		$http(req).then(function(response) {
			$scope.jsonData=JSON.parse(response.data);
    	});
	};
	
	
});

