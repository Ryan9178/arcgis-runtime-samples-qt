// [WriteFile Name=Feature_Collection_Layer, Category=Layers]
// [Legal]
// Copyright 2016 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// [Legal]

import QtQuick 2.6
import Esri.ArcGISRuntime 100.1
import Esri.ArcGISExtras 1.1

Rectangle {
    id: rootRectangle
    clip: true
    width: 800
    height: 600

    property real scaleFactor: System.displayScaleFactor

    MapView {
        id: mapView
        anchors.fill: parent

        Map {
            BasemapOceans {}

            // Declare a FeatureCollectionLayer
            FeatureCollectionLayer {

                // Create a FeatureCollection inside the
                FeatureCollection {

                    // Create a Point FeatureCollectionTable inside the FeatureCollection
                    FeatureCollectionTable {
                        id: pointsTable

                        // define the schema of the table
                        geometryType: Enums.GeometryTypePoint
                        spatialReference: SpatialReference.createWgs84()
                        Field {
                            id: placeField
                            alias: "Place Name"
                            name: "Place"
                            length: 50
                            fieldType: Enums.FieldTypeText
                        }

                        // define the renderer
                        SimpleRenderer {
                            SimpleMarkerSymbol {
                                style: Enums.SimpleMarkerSymbolStyleTriangle
                                color: "red"
                                size: 18
                            }
                        }

                        Component.onCompleted: {
                            // Create a new point feature, provide geometry and attribute values
                            var pointFeature = pointsTable.createFeature();
                            pointFeature.attributes.replaceAttribute("Place", "Current location");
                            var point1 = ArcGISRuntimeEnvironment.createObject("Point", {x: -79.497238, y: 8.849289, spatialReference: SpatialReference.createWgs84()});
                            pointFeature.geometry = point1;

                            // Add to the table
                            pointsTable.addFeature(pointFeature);
                        }
                    }

                    // Create a Point FeatureCollectionTable inside the FeatureCollection
                    FeatureCollectionTable {
                        id: linesTable

                        // define the schema of the table
                        geometryType: Enums.GeometryTypePolyline
                        spatialReference: SpatialReference.createWgs84()
                        Field {
                            alias: "Boundary Name"
                            name: "Boundary"
                            length: 50
                            fieldType: Enums.FieldTypeText
                        }

                        // define the renderer
                        SimpleRenderer {
                            SimpleLineSymbol {
                                style: Enums.SimpleLineSymbolStyleDash
                                color: "green"
                                width: 3
                            }
                        }

                        Component.onCompleted: {
                            // Create a new polyline feature, provide geometry and attribute values
                            var lineFeature = linesTable.createFeature();
                            lineFeature.attributes.replaceAttribute("Boundary", "AManAPlanACanalPanama");
                            var point1 = ArcGISRuntimeEnvironment.createObject("Point", {x: -79.497238, y: 8.849289, spatialReference: SpatialReference.createWgs84()});
                            var point2 = ArcGISRuntimeEnvironment.createObject("Point", {x: -80.035568, y: 9.432302, spatialReference: SpatialReference.createWgs84()});
                            var lineBuilder = ArcGISRuntimeEnvironment.createObject("PolylineBuilder", {spatialReference: SpatialReference.createWgs84()});
                            lineBuilder.addPoint(point1);
                            lineBuilder.addPoint(point2);
                            lineFeature.geometry = lineBuilder.geometry;

                            // Add to the table
                            linesTable.addFeature(lineFeature);
                        }
                    }

                    // Create a Point FeatureCollectionTable inside the FeatureCollection
                    FeatureCollectionTable {
                        id: polygonTable

                        // define the schema of the table
                        geometryType: Enums.GeometryTypePolygon
                        spatialReference: SpatialReference.createWgs84()
                        Field {
                            alias: "Area Name"
                            name: "Area"
                            length: 50
                            fieldType: Enums.FieldTypeText
                        }

                        // define the renderer
                        SimpleRenderer {
                            // fill
                            SimpleFillSymbol {
                                style: Enums.SimpleFillSymbolStyleDiagonalCross
                                color: "cyan"

                                // outline
                                SimpleLineSymbol {
                                    style: Enums.SimpleLineSymbolStyleSolid
                                    color: "blue"
                                    width: 2
                                }
                            }
                        }

                        Component.onCompleted: {
                            // Create a new point feature, provide geometry and attribute values
                            var polygonFeature = linesTable.createFeature();
                            polygonFeature.attributes.replaceAttribute("Area", "Restricted area");
                            var point1 = ArcGISRuntimeEnvironment.createObject("Point", {x: -79.497238, y: 8.849289, spatialReference: SpatialReference.createWgs84()});
                            var point2 = ArcGISRuntimeEnvironment.createObject("Point", {x: -79.337936, y: 8.638903, spatialReference: SpatialReference.createWgs84()});
                            var point3 = ArcGISRuntimeEnvironment.createObject("Point", {x: -79.11409, y: 8.895422, spatialReference: SpatialReference.createWgs84()});
                            var polygonBuilder = ArcGISRuntimeEnvironment.createObject("PolygonBuilder", {spatialReference: SpatialReference.createWgs84()});
                            polygonBuilder.addPoint(point1);
                            polygonBuilder.addPoint(point2);
                            polygonBuilder.addPoint(point3);
                            polygonFeature.geometry = polygonBuilder.geometry;

                            // Add to the table
                            polygonTable.addFeature(polygonFeature);
                        }
                    }
                }
            }

            // set initial extent
            ViewpointExtent {
                Envelope {
                    xMax: -8800611.655131537
                    xMin: -8917856.590171767
                    yMax: 1100327.8941287803
                    yMin: 903277.583136797
                    spatialReference: SpatialReference.createWebMercator()
                }
            }
        }
    }

    // Neatline rectangle
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border {
            width: 0.5 * scaleFactor
            color: "black"
        }
    }
}