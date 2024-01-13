// App/javascript/channels/notification_channel.js
import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to Notification Channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from Notification Channel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Nouvelle notification :', data.message);

    // Exemple : Mettre à jour l'interface utilisateur avec une notification
    alert('Nouveau trajet créé : ' + data.message);
    // Vous pouvez personnaliser cela en utilisant des bibliothèques de notification ou d'autres méthodes
  }
});
