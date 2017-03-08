package net.matskevich.taskapp.service;

import net.matskevich.taskapp.dao.ProjectDao;
import net.matskevich.taskapp.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService{
    @Autowired
    private ProjectDao projectDao;

    @Override
    public void addProject(Project project) {
        projectDao.save(project);
    }

    @Override
    public Project getProjectById(Integer id) {
        return projectDao.findOne(id);
    }

    @Override
    public List<Project> listProjects() {
        return projectDao.findAll();
    }


}
