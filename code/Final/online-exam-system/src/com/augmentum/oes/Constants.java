package com.augmentum.oes;

public class Constants {
    // Constants for UserTable
    public final static String ID_IN_USER = "id";
    public final static String USERNAME_IN_USER = "username";
    public final static String PASSWORD_IN_USER = "password";

    // Constants for UserDao
    public final static String SELECT_FROM_USER = "SELECT * FROM user WHERE username = ?";

    // Constants for UserService
    public final static String USERNAME_PARAMETER_ERROR = "usernameParameterError";
    public final static String USERNAME_PARAMETER_ERROR_MESSAGE = "Parameter of username is error";
    public final static String PASSWORD_PARAMETER_ERROR = "passwordParameterError";
    public final static String PASSWORD_PARAMETER_ERROR_MESSAGE = "Parameter of password is error";
    public final static String USERNAME_SERVICE_ERROR_MESSAGE = "Username does not exits!";
    public final static String PASSWORD_SERVICE_ERROR_MESSAGE = "Login password is incorrect!";

    // Constants for UserController
    public final static String USER_READY_TO_LOGIN = "/readyToLoginServlet.action";
    public final static String USER_LOGIN = "/loginServlet.action";
    public final static String USER_READY_TO_LOGOUT = "/readyToLogoutServlet.action";



    // Constants for UserServlet
    public final static String USER_LOGIN_JSP = "/WEB-INF/jsp/user_login.jsp";
    public final static String USER_WELCOME_JSP = "/WEB-INF/jsp/user_welcome.jsp";
    public final static String USER = "user";
    public final static String PARAMETER_ERROR_FIELD = "paremeter_error_field";
    public final static String SERVICE_ERROR = "service_error";
    public final static String IS_REMEMBER = "selected";
    public final static String COOKIE_USERNAME = "cookie_username";
    public final static String COOKIE_PASSWORD = "cookie_password";
    public final static String IS_LOGOUT = "input_user_logout";
    public final static String COOKIE_GENERATE = "cookie_generate";
    public final static String COOKIE_CLEAN = "cookie_clean";
    public final static String SESSION_GENERATE = "session_generate";

    // Constants for QuestionTable
    public final static String ID_IN_QUESTION = "id";
    public final static String QUESTION_NAME_IN_QUESTION = "question_name";
    public final static String OPTION_A_IN_QUESTION = "option_a";
    public final static String OPTION_B_IN_QUESTION = "option_b";
    public final static String OPTION_C_IN_QUESTION = "option_c";
    public final static String OPTION_D_IN_QUESTION = "option_d";
    public final static String CORRECT_OPTION_IN_QUESTION = "correct_option";
    public final static String STATUS_IN_QUESTION = "status";
    public final static String CREATE_BY_IN_QUESTION = "create_by";
    public final static String CREATE_TIME_IN_QUESTION = "create_time";
    public final static String UPDATE_BY_IN_QUESTION = "update_by";
    public final static String UPDATE_TIME_IN_QUESTION = "update_time";
    public final static int QUESTION_CAN_BE_SELECTED = 1;
    public final static String COUNT_IN_QUESTION = "count(*)";

    // Constants for QuestionDao
    public final static String INSERT_INTO_QUESTION = "INSERT INTO question (question_name, option_a, option_b, option_c, option_d, correct_option, status, create_by, create_time, update_by, update_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    public final static String UPDATE_QUESTION = "UPDATE question SET question_name = ?, option_a = ?, option_b = ?, option_c = ?, option_d = ?, correct_option = ?, update_by = ?, update_time = ? WHERE id = ?";
    public final static String DELETE_FROM_QUESTION = "UPDATE question SET status = 0, update_by = ?, update_time = ? WHERE id = ?";
    public final static String SELECT_FROM_QUESTION = "SELECT * FROM question WHERE id = ?";
    public final static String SELECT_FROM_QUESTION_ASC = "SELECT * FROM question WHERE status = 1 AND question_name LIKE '%%' ORDER BY id ASC LIMIT ?, ?";
    public final static String SELECT_FROM_QUESTION_DESC = "SELECT * FROM question WHERE status = 1 AND question_name LIKE '%%' ORDER BY id DESC LIMIT ?, ?";
    public final static String SELECT_COUNT_FROM_QUESTION = "SELECT count(*) FROM question WHERE status = 1";
    public final static String SELECT_LAST_FROM_QUESTION = "SELECT * FROM question ORDER BY id DESC LIMIT 0, 1";

    // Constants for QuestionService
    // TODO

    // Constants for QuestionServlet
    public final static String QUESTION_CREATE_JSP = "/WEB-INF/jsp/question_create.jsp";
    public final static String QUESTION_FIND_JSP = "/WEB-INF/jsp/question_find.jsp";
    public final static String QUESTION_CREATE_SERVLET = "/questionCreateServlet.action";
    public final static String QUESTION_EDIT_SERVLET = "/readyToEditServlet.action";
    public final static String QUESTION_FIND_SERVLET = "/findServlet.action";
    public final static String QUESTION_LIST = "questionList";

    // Constants for Util
    public final static String APP_PROPERTIES = "app.properties";
    public final static String JDBC_DRIVER = "jdbc.driver";
    public final static String JDBC_URL = "jdbc.url";
    public final static String JDBC_USER = "jdbc.user";
    public final static String JDBC_PASSWORD = "jdbc.password";
    public final static String SIMPLE_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
}
