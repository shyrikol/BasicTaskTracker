package net.matskevich.taskapp.service;

import net.matskevich.taskapp.model.Comment;
import net.matskevich.taskapp.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentDao commentDao;

    @Override
    public void addComment(Comment comment) {
        commentDao.save(comment);
    }

    @Override
    public List<Comment> listComments() {
        return commentDao.findAll();
    }

    @Override
    public void removeComment(int id) {
         commentDao.delete(id);
    }

    @Override
    public void updateComment(Comment comment) {
        commentDao.save(comment);
    }

    @Override
    public Comment getCommentById(Integer id) {
        return commentDao.findOne(id);
    }
}
