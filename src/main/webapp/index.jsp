<html>
<head>
<link rel="stylesheet" type="text/css" href="/microservice/css/bootstrap.min.css"/>
<script src="/microservice/js/angular.min.js"></script>
<script src="/microservice/js/angular-route.min.js"></script>
<script src="/microservice/js/app.js"></script>
</head>
<body ng-app="Poc" ng-controller="PageController">
<div class="row">
 	<div class="col-sm-8 offset-sm-2">
		<div class="row">
			<div class="col-sm-12" style="padding-left:0px;padding-right:0px;"> 
			<ul class="nav nav-tabs nav-justified">
			  <li class="nav-item"><a class="nav-link" ng-class="{'active':currentTab==='company'}" ng-click="switch('company')" href="#!company">Company</a></li>
  					<li class="nav-item"><a class="nav-link"  ng-class="{'active':currentTab==='employee'}" ng-click="switch('employee')"href="#!employee">Employee</a></li>
  					<li class="nav-item"><a class="nav-link" ng-class="{'active':currentTab==='plan'}" ng-click="switch('plan')" href="#!plan">Plan</a></li>
  					<li class="nav-item"><a class="nav-link" ng-class="{'active':currentTab==='template'}" ng-click="switch('template')" href="#!template">Vest Template</a></li>
  					<li class="nav-item"><a class="nav-link" ng-class="{'active':currentTab==='award'}" ng-click="switch('award')" href="#!award">Award</a></li>
			 </ul>
			</div>
		</div>
		<div class="row" style="border:1px solid #ced4da;border-top:none;">
		<div class="col-sm-8 offset-sm-2" style="padding-top: 20px;">
					<div ng-view> </div>
		</div>
		</div>
	</div>
</div>
</body>
<script>
</script>
</html>
