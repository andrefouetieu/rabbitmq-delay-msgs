# rabbitmq-delay-msgs


1. avoir un object Event interface Event {
   // Typical event properties like id, type, timestamp, etc.
   id: string;
   type: string;
   timestamp: number;
    processDate?: number;
   }
2. le timestamp: number; indique le moment de création de l'événement
3. processDate indique la date a laquelle l'Event sera traite
4. Utilise Rabbitmq pour gerer les delay messages 


# build de l'application
1. use github ci pour build l'application et construire l'artifact sur un nexus

# dans une machine virtuelle 
-installer vault
-installer argcd
-installer nexus
