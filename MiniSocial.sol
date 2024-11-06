// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    // Structure to hold the message and the author's address
    struct Post {
        string message;    // Message posted by the user
        address author;    // Address of the user who posted the message
    }

    // Array to store all posts
    Post[] public posts;

    // Function to publish a new post
    function publishPost(string memory _message) public {
        // Create a new Post and add it to the posts array
        posts.push(Post(_message, msg.sender));
    }

    // Function to retrieve a post by its index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Post does not exist.");
        // Return the message and author of the post at the given index
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    // Function to retrieve the total number of posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}