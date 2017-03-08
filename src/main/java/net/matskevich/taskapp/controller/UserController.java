package net.matskevich.taskapp.controller;

import net.matskevich.taskapp.model.Comment;
import net.matskevich.taskapp.model.Project;
import net.matskevich.taskapp.model.Task;
import net.matskevich.taskapp.model.User;
import net.matskevich.taskapp.service.*;
import net.matskevich.taskapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.listTasks());
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "welcome";
    }



    @RequestMapping(value = "/welcome/add", method = {RequestMethod.GET, RequestMethod.POST})
    public String addProjectrthnitrjgkl(@RequestParam("ide") String idProject, @ModelAttribute("project") Project project){
        project.setUser(userService.findByUsername(idProject));
        if(project.getProjectId() == 0){
            this.projectService.addProject(project);
        }

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/welcome/addu", method = RequestMethod.POST)
    public String addTask(@RequestParam("currentProj") Integer pr, @ModelAttribute("task") Task task){
        task.setProject(projectService.getProjectById(pr));
        if(task.getId() == 0){
            this.taskService.addTask(task);
        }
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/admin")
    public String addTaski(@RequestParam(value = "currentProj", required = false) String pr, Model model){
        model.addAttribute("username", pr);
        model.addAttribute("project", new Project());
        model.addAttribute("listProjects", this.projectService.listProjects());
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.listTasks());
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "admin";
    }



    @RequestMapping(value = "/projectdata/taskdata/addc", method = RequestMethod.POST)
    public String addComment(@RequestParam("currentTask") Integer id, @ModelAttribute("comment") Comment comment){
        comment.setTask(taskService.getTaskById(id));
        if(comment.getId() == 0){
            this.commentService.addComment(comment);
        }else {
            this.commentService.updateComment(comment);
        }
        return "redirect:/projectdata/taskdata/"+id;
    }

    @RequestMapping("projectdata/{id}")
    public String projectData(@PathVariable("id") int id, Model model){
        model.addAttribute("listTasks", this.taskService.listTasks());
        model.addAttribute("id", id);
        return "projectdata";
    }

    @RequestMapping("projectdata/taskdata/{id}")
    public String taskSata(@PathVariable("id") int id, Model model){
        model.addAttribute("comment", new Comment());
        model.addAttribute("listComments", this.commentService.listComments());
        model.addAttribute("id", id);
        return "taskdata";
    }

    @RequestMapping("/remove/{id}/{tId}")
    public String removeComment(@PathVariable("id") int id, @PathVariable("tId") int tId){
        this.commentService.removeComment(id);

        return "redirect:/projectdata/taskdata/"+tId;
    }
}
