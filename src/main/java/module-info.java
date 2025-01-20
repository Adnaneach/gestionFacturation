module ma.enim.project {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires org.kordamp.bootstrapfx.core;
    requires java.sql;
    requires static lombok;
    requires java.desktop;
    requires org.testng;
//    requires org.junit.platform.commons;
    requires java.mail;
    requires activation;

    requires MaterialFX;
    requires jbcrypt;
    requires com.jfoenix;
    requires com.fasterxml.jackson.databind;
    requires org.json;
    requires styled.xml.parser;
    requires org.apache.pdfbox;
//    requires styled.xml.parser;
//    requires org.apache.pdfbox;


    opens ma.enim.project to javafx.fxml;
    opens ma.enim.project.test to org.json;



    exports ma.enim.project;
    exports ma.enim.project.entity;
    exports ma.enim.project.test;
    exports ma.enim.project.controller;

    opens ma.enim.project.controller to javafx.fxml;
}