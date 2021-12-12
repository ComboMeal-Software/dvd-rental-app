'use strict';

angular.module('app.mainPage', []).directive('appMainPage', [function () {
    return {
        templateUrl: 'modules/main-page/main-page.html'
    };
}]).controller('MainPageCtrl', ['$scope', '$http', '$location', '$window', function ($scope, $http, $location, $window) {
    $scope.baseUrl = new $window.URL($location.absUrl()).origin;

    $scope.mode = 'dvd';
    $scope.searchText = '';

    $scope.showLoader = false;
    $scope.showLoadError = false;

    $scope.dvdData = [];
    $scope.clientData = [];

    $scope.loadDvds = () => {
        $scope.takenOnly = !$scope.takenOnly;
        $scope.showLoader = true;
        $scope.dvdData = [];

        $http({
            method: 'GET',
            url: $scope.baseUrl + '/dvd-rental-app/dvd/find',
            params: {name: $scope.searchText},
        }).then(response => {
            $scope.dvdData = response.data;
        }).catch(() => {
            $scope.showLoadError = true;
        }).finally(() => {
            $scope.showLoader = false;
        });
    }

    $scope.loadDvds();
}]);
