'use strict';

angular.module('app.mainPage', []).directive('appMainPage', [function () {
    return {
        templateUrl: 'modules/main-page/main-page.html'
    };
}]).controller('MainPageCtrl', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
    $scope.mode = 'dvd';
    $scope.showLoader = false;

    $scope.dvdData = [];
    $scope.clientData = [];

    $scope.updateDvds = async () => {
        $scope.takenOnly = !$scope.takenOnly;
        $scope.showLoader = true;
        $scope.dvdData = [];

        $timeout(function () {
            $scope.showLoader = false;

            $scope.dvdData = [
                {
                    "id": 9,
                    "title": "Prince of Persia: The Sands of Time",
                    "productionYear": 2010,
                    "typeId": 2
                },
                {
                    "id": 21,
                    "title": "Prince of Persia",
                    "productionYear": 2008,
                    "typeId": 2
                }
            ]
        }, 1000);

        // $http.get("http://localhost:8081/lw5/main-json.jsp" + ($scope.takenOnly ? "?taken_only=true" : ""))
        //     .then(response => {
        //         $scope.showLoader = false;
        //         $scope.dvdData = response.data;
        //     });
    }

    $scope.updateDvds();
}]);
