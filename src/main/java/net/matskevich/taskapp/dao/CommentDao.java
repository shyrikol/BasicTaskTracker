package net.matskevich.taskapp.dao;


import net.matskevich.taskapp.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDao extends JpaRepository<Comment, Integer> {
}
