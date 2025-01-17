FROM eclipse-temurin:17-jdk AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier pom.xml et le dossier src dans le conteneur
COPY pom.xml .
COPY src ./src

# Construire l'artefact (JAR)
RUN mvn clean package -DskipTests

# Étape 2 : Créer une image d'exécution avec Temurin JRE
FROM eclipse-temurin:17-jre

# Définir le répertoire de travail
WORKDIR /app

# Copier l'artefact JAR depuis l'étape de construction
COPY --from=build /app/target/*.jar ./app.jar

# Exposer le port sur lequel l'application écoute (à adapter selon votre application)
EXPOSE 8080

# Commande par défaut pour exécuter l'application
CMD ["java", "-jar", "app.jar"]
