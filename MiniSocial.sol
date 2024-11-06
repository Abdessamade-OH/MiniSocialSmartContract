// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    // Structure pour stocker le message et l'adresse de l'auteur
    struct Post {
        string message;    // Message publié par l'utilisateur
        address author;    // Adresse de l'utilisateur qui a publié le message
    }

    // Tableau pour stocker tous les messages
    Post[] public posts;


    // Fonction pour publier un nouveau message
    function publishPost(string memory _message) public {
        // Créer un nouveau message et l'ajouter au tableau des messages
        posts.push(Post(_message, msg.sender));
    }

    // Fonction pour récupérer un message par son index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Le message n'existe pas.");
        // Retourner le message et l'auteur du message à l'index donné
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    // Fonction pour récupérer le nombre total de messages
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
