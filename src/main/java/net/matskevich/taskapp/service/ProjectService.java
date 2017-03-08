package net.matskevich.taskapp.service;

import net.matskevich.taskapp.model.Project;

import java.util.List;

public interface ProjectService {
    void addProject(Project project);

    Project getProjectById(Integer id);

    List<Project> listProjects();


}
