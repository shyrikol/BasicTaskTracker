package net.matskevich.taskapp.service;

import net.matskevich.taskapp.dao.TaskDao;
import net.matskevich.taskapp.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService{
    @Autowired
    private TaskDao taskDao;

    @Override
    public void addTask(Task task) {
        taskDao.save(task);
    }

    @Override
    public Task getTaskById(Integer id) {
        return taskDao.findOne(id);
    }

    @Override
    public List<Task> listTasks() {
        return taskDao.findAll();
    }
}
