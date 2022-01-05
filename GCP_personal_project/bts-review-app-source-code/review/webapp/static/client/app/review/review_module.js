(function () {

    var module = angular.module('qiqReview', ['ngRoute']);

    module.config(['$routeProvider', config]);


    function config($routeProvider) {
        $routeProvider.when('/review/post', {
            controller: 'ReviewController',
            controllerAs: 'rc',
            templateUrl: 'app/review/review.html'
        });
    }


})();
