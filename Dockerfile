# Étape 1 : Utiliser l'image Temurin pour la phase de build
FROM eclipse-temurin:17-jdk AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier pom.xml et le dossier src dans le conteneur
COPY pom.xml .
COPY src ./src
COPY .mvn ./.mvn
COPY mvnw .

# Étape 2 : Copier le JAR déjà construit par CI
FROM eclipse-temurin:17-jre

# Définir le répertoire de travail
WORKDIR /app

# Copier l'artefact JAR depuis l'étape de build CI (ne pas faire de clean package dans Docker)
COPY target/*.jar ./app.jar

# Exposer le port sur lequel l'application écoute (à adapter selon votre application)
EXPOSE 8080

# Commande par défaut pour exécuter l'application
CMD ["java", "-jar", "app.jar"]
