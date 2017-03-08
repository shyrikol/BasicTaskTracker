package net.matskevich.taskapp.service;

import net.matskevich.taskapp.model.Comment;

import java.util.List;

public interface CommentService {
    void addComment(Comment comment);

    List<Comment> listComments();

    void removeComment(int id);

    void updateComment(Comment comment);

    Comment getCommentById(Integer id);
}