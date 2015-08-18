// Copyright 2015 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import QtQuick 2.3
import Esri.ArcGISRuntime 100.00

Rectangle {
    width: 800
    height: 600

    // Create the MapView
    MapView {
        anchors.fill: parent
        // Nest the Map as a child of the MapView
        Map {            
            // Nest the Basemap to add it as the Map's Basemap
            Basemap {                
                // Nest the ArcGISTiledLayer to add it as one of the Basemap's baseLayers
                ArcGISTiledLayer {
                    url: "http://services.arcgisonline.com/arcgis/rest/services/NatGeo_World_Map/MapServer"
                }
            }
        }
    }
}

