'use strict';

angular.module('app.addDvdPage', []).directive('appAddDvdPage', [function () {
    return {
        templateUrl: 'modules/add-dvd-page/add-dvd-page.html'
    };
}]).controller('AddDvdPageCtrl', ['$scope', '$http', '$location', '$timeout', function ($scope, $http, $location, $timeout) {
    $scope.showLoader = true;
    $scope.showLoadError = false;

    $scope.categoriesData = [];
    $scope.dvd = {};

    $scope.loadCategories = () => {
        $timeout(function () {
            $scope.categoriesData = [
                {
                    "id": 1,
                    "type": 'Film'
                },
                {
                    "id": 2,
                    "type": 'Videogame'
                },
                {
                    "id": 3,
                    "type": 'Music album'
                }, {
                    "id": 4,
                    "type": 'TV series'
                }, {
                    "id": 5,
                    "type": 'Animated film'
                },
                {
                    "id": 6,
                    "type": 'Animated series'
                },
            ];

            $scope.showLoader = false;

            if (!$scope.categoriesData?.length) {
                $scope.showLoadError = true;
                return;
            }

            $scope.dvd.typeId = $scope.categoriesData[0].id;
        }, 1000);
    }

    $scope.submitForm = () => {
        $http({
            method: 'POST',
            url: 'http://localhost',
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
