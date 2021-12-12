'use strict';

angular.module('app.addDvdPage', []).directive('appAddDvdPage', [function () {
    return {
        templateUrl: 'modules/add-dvd-page/add-dvd-page.html'
    };
}]).controller('AddDvdPageCtrl', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
    $scope.categoriesData = [];

    $scope.loadCategories = async () => {
        $timeout(function () {
            $scope.categoriesData = [
                {
                    "id": 1,
                    "name": 'Film'
                },
                {
                    "id": 2,
                    "name": 'Videogame'
                },
                {
                    "id": 3,
                    "name": 'Music album'
                }, {
                    "id": 4,
                    "name": 'TV series'
                }, {
                    "id": 5,
                    "name": 'Animated film'
                },
                {
                    "id": 6,
                    "name": 'Animated series'
                },
            ]
        }, 1000);

        // $http.get("http://localhost:8081/lw5/main-json.jsp" + ($scope.takenOnly ? "?taken_only=true" : ""))
        //     .then(response => {
        //         $scope.showLoader = false;
        //         $scope.dvdData = response.data;
        //     });
    }

    $scope.loadCategories();
}]);
