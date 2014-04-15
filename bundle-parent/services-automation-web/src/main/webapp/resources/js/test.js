var testApp = angular.module('testApp', [ 'ngRoute' ]);

// configure our routes
testApp.config(function($routeProvider) {
	$routeProvider

	// route for the home page
	.when('/', {
		templateUrl : 'pages/home.html',
		controller : 'mainController'
	})

	// route for the about page
	.when('/about', {
		templateUrl : 'pages/about.html',
		controller : 'aboutController'
	})

	// route for the contact page
	.when('/contact', {
		templateUrl : 'pages/contact.html',
		controller : 'contactController'
	});
});

// create the controller and inject Angular's $scope
testApp.controller('mainController', function($scope) {
	// create a message to display in our view
	$scope.message = 'This is an injected Home Page!';
});

testApp.controller('aboutController', function($scope) {
	$scope.message = 'Some About info here...';
});

testApp.controller('contactController', function($scope) {
	$scope.message = 'Some contact info here... although I\'d rather not';
});