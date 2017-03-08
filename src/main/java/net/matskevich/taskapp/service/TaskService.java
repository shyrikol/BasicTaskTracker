package net.matskevich.taskapp.service;

import net.matskevich.taskapp.model.Task;

import java.util.List;

public interface TaskService {
    void addTask(Task task);

    Task getTaskById(Integer id);

    List<Task> listTasks();
}
