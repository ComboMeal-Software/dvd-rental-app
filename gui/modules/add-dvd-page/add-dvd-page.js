'use strict';

angular.module('app.addDvdPage', []).directive('appAddDvdPage', [function () {
    return {
        templateUrl: 'modules/add-dvd-page/add-dvd-page.html'
    };
}]).controller('AddDvdPageCtrl', ['$scope', '$http', '$location', function ($scope, $http, $location) {
    $scope.showLoader = true;
    $scope.showLoadError = false;

    $scope.categoriesData = [];
    $scope.dvd = {};

    $scope.loadCategories = () => {
        $http({
            method: 'GET',
            url: 'http://localhost:8081/dvd-rental-app/dvd/types',
        }).then(response => {
            $scope.categoriesData = response;
            $scope.dvd.typeId = $scope.categoriesData[0].id;
        }).catch(() => {
            $scope.showLoadError = true;
        }).finally(() => {
            $scope.showLoader = false;
        });
    }

    $scope.submitForm = () => {
        $http({
            method: 'POST',
            url: 'http://localhost/dvd-rental-app/dvd/create',
            data: $scope.dvd,
        }).then(response => {
            alert('Success!');
            $location.path("main");
        }).catch(response => {
            alert('Error was occurred!');
        });
    };

    $scope.loadCategories();
}]);
