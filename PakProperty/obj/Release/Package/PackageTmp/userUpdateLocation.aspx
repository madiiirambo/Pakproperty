<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userUpdateLocation.aspx.cs" Inherits="PakProperty.userUpdateLocation" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Place Autocomplete Restricted to Multiple Countries</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 70%;
        width: 90%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 15;
        padding: 10;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
    </style>
  </head>
  <body>

      <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <h1>           ENTER LOCATION OF YOUR PROPERTY</h1>
      </div>
    <div class="pac-card" id="pac-card">
      <div>
        <div id="title">
          PakProperty
        </div>
        <div id="country-selector" class="pac-controls">
          <input type="radio" name="type" id="changecountry-usa-and-uot" checked="checked">
          <label for="changecountry-pak1">Pakistan Location</label>
        </div>
      </div>
      <div id="pac-container">

                    

        <input id="pac-input" type="text"
            placeholder="Enter a location">
      </div>
    </div>
      <br />
    <div id="map"></div>
    <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>
      <br />


      <form runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="go" runat="server" OnClick="update" Text="Click To Further Information" />
          <br />

          <asp:TextBox id="latitude"  runat="server"></asp:TextBox>
          <asp:TextBox id="longitude"  runat="server"></asp:TextBox>

          </form>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: { lat: 24.8754, lng: 67.0410 },
          zoom: 3
        });
       
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var countries = document.getElementById('country-selector');

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Set initial restrict to the greater list of countries.
        autocomplete.setComponentRestrictions(
            {'country': ['pak']});

        // Specify only the data fields that are needed.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);



          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }
            

          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          document.getElementById("latitude").value = place.geometry.location.lat();
          document.getElementById("longitude").value = place.geometry.location.lng();
         
          infowindow.open(map, marker);

        });

        // Sets a listener on a given radio button. The radio buttons specify
          // the countries used to restrict the autocomplete search.

    


        function setupClickListener(id, countries) {

          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
              autocomplete.setComponentRestrictions({ 'country': countries });
            

          });

        }


        setupClickListener('changecountry-pak', 'pak');
        setupClickListener(
            'changecountry-pak1', ['pak']);
        
          
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOKN_aSYiW40FCEVh7AQkgkLGStmyuuTQ&libraries=places&callback=initMap"
        async defer></script>
  </body>
</html>