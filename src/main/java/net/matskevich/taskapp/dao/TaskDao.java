package net.matskevich.taskapp.dao;

import net.matskevich.taskapp.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskDao extends JpaRepository<Task, Integer> {
}
