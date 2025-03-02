# Advisor-Chatbot-Design
A repo dedicated to system design considerations for a hypothetical AI Chatbot to assist Students, Advisors and Administrators of a University.

## Overview
This document provides a structured explanation of the UML diagrams and design components used in this project. These diagrams help visualize the system's architecture, components, and interactions.

---

## 1. Use Case Diagram
### **Description**
The Use Case Diagram illustrates the interactions between users (actors) and the system, depicting the functionalities available to different user roles.

### **Key Elements:**
- **Actors**: Student, Advisor, Administrator, University Systems
- **Use Cases**: Ask Course Questions, Ask Program Quesions, Ask Policy Questions
- **Relationships**: Students, Administrators, and Advisors will leverage the chatbot to ask questions about courses, programs etc.


---

## 2. Domain Model Diagram
### **Description**
Represents the key entities and their relationships in the problem domain.

### **Key Components:**
- **Entities**: User, Question, Response, Feedback, Course, Program, Policy, University System
- **Relationships**: User asks Questions, Question generates a Response, Response recieves Feedback, Course is part of Program etc.


---

## 3. Class Diagram
### **Description**
The Class Diagram represents the static structure of the system, including classes, attributes, methods, and relationships.

### **Key Elements:**
- **Classes**: User, Question, Response, Feedback, Course, Program, Policy, University System
- **Associations**: User asks Question, chatbot deteremines where to route question, university data is scanned, response is prompted to user.
- **Visibility**: (+) Public

### **Purpose:**
- Serves as a blueprint for implementation.
- Defines the system's object-oriented structure.

---

## 4. System Sequence Diagram
### **Description**
The System Sequence Diagram (SSD) represents the sequence of interactions between an actor and the system for a specific use case.

### **Key Elements:**
- **Actors**: Student, Chatbot, UniversitySystem.
- **System**: The boundary representing the application.
- **Interactions**: Student asks a question, Chatbot processes the question, Chatbot fetches data from UniversitySystem, Chatbot generates and sends a response, Student provides feedback.

### **Purpose:**
- Captures the flow of events for a given use case.
- Helps in understanding system behavior before defining detailed logic.

---

## 5. State Diagram
### **Description**
The State Diagram represents the various states an entity can be in and the transitions between those states based on events.

### **Key Elements:**
- **States**: New, Processing, Resolved, Archived.
- **Transitions**: Question Asked, Response Generated, Feedback Provided, Timeout.

### **Purpose:**
- Helps in understanding dynamic behavior of the system.
- Useful for modeling state-dependent processes such as user sessions, transactions, or workflows.

---

## 6. Activity Diagram
### **Description**
The Activity Diagram represents the workflow of various operations in the system, showing the sequence of activities and decision points.

### **Key Elements:**
- **Activities**: Ask Question, Process Question, Fetch Course Data, Generate Response, Send Response, Provide Feedback, Log Feedback, Archive Question.
- **Decision Nodes**: Is Response Generated? Is Feedback Valid?

### **Purpose:**
- Provides a visual representation of workflows and business logic.
- Helps identify bottlenecks or inefficiencies in system processes.

---

## 7. Component Diagram
### **Description**
The Component Diagram visualizes the organization and dependencies of various components in the system.

### **Key Elements:**
- **Components**: User Interface, Chatbot Service, NLP Engine, University System API, Database, Feedback Service, Analytics Dashboard.
- **Interfaces**: Define how components interact with each other.
- **Dependencies**: User Interface depends on Chatbot Service, Chatbot Service depends on NLP Engine and University System API, etc.

### **Purpose:**
- Helps understand the system's modular structure.
- Aids in deployment planning and dependency management.

---

## 8. Cloud Deployment Diagram
### **Description**
The Cloud Deployment Diagram illustrates the deployment architecture of the system in a cloud environment, showing different cloud services and their interactions.

### **Key Elements:**
- **Cloud Services**: Amazon S3, AWS Lambda, Amazon Comprehend, Amazon RDS, Amazon API Gateway, Amazon CloudFront, Amazon CloudWatch

### **Purpose:**
- Provides a high-level understanding of the system's cloud architecture.
- Helps in planning scalability, security, and cloud service integration.

---

## Open-Source Chatbot Frameworks
### Rasa - https://github.com/RasaHQ/rasa

Architecture highlights: Modular NLU and dialogue management components
UML documentation: Rasa Architecture
Notable design patterns:

Pipeline architecture for language processing
Policy-based dialogue management
Training data abstraction



### Botpress - https://github.com/botpress/botpress

Architecture highlights: Event-driven, modular design with clear separation of concerns
Design documentation: Botpress Architecture
Notable design patterns:

Content management abstraction
Dialog flow representation through state machines
Middleware pattern for processing pipelines



### BotKit - https://github.com/howdyai/botkit

Architecture highlights: Simple but extensible event system
Design documentation: BotKit Core Concepts
Notable design patterns:

Middleware pipeline
Adapter pattern for platform integration
Event-driven programming model

---

## Chatbot Blogs

### https://rasa.com/docs/rasa/arch-overview/

### https://medium.com/@ranadevrat/creating-a-chatbot-using-open-source-llm-and-rag-technology-with-lang-chain-and-flask-ca2f5511e82e

### https://medium.com/philips-technology-blog/leveraging-ai-chatbot-to-visualize-software-architecture-with-plantuml-a1500c060f5b