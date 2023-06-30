package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style_LG.css\">\n");
      out.write("        <script src=\"../custom-scripts.js\" defer></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div class=\"title\">\n");
      out.write("                Login\n");
      out.write("            </div>\n");
      out.write("            <form id=\"form1\" action=\"login\" method=\"post\">\n");
      out.write("                ");

                    String alertMessage = (String) request.getSession().getAttribute("alertMessage");
                    if (alertMessage != null) {
                
      out.write("\n");
      out.write("                <div class=\"alert alert-warning\" style=\"color: red\">");
      out.print( alertMessage);
      out.write("</div>\n");
      out.write("                ");

                        // Xóa thuộc tính session để tránh hiển thị lại cảnh báo
                        request.getSession().removeAttribute("alertMessage");
                    }
                
      out.write("\n");
      out.write("                <div class=\"field\">\n");
      out.write("                    <input type=\"email\" required name = \"email\" pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$\" title=\"Wrong format email\">\n");
      out.write("                    <label>Email Address</label>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"field\">\n");
      out.write("                    <input type=\"password\" required name = \"pass\">\n");
      out.write("                    <label>Password</label>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"content\">\n");
      out.write("                    <div class=\"roleChoice\">\n");
      out.write("                        <select name=\"optionRole\" >\n");
      out.write("                            <option value=\"optionuser\" >User</option>\n");
      out.write("                            <option value=\"optionhospital\" >Hospital</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <span class=\"navbar-text pass-link\">\n");
      out.write("                        <a data-toggle=\"modal\" data-target=\"#loginModal\">\n");
      out.write("                            <span class=\"fa fa-sign-in\"></span> Forgot password?</a>\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"field\">\n");
      out.write("                    <input type=\"submit\" value=\"Login\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"signup-link\">\n");
      out.write("                    Not a member? <a href=\"register.jsp\">Signup now</a>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div id=\"loginModal\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("            <div class=\"modal-dialog modal-md\" role=\"content\">\n");
      out.write("                <!-- Modal content-->\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\" style=\"background: linear-gradient(-135deg, #c850c0, #4158d0);\">\n");
      out.write("                        <h4 class=\"modal-title\" style=\"color: white;\" >Forgot Password </h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" style=\"margin-top: -4%;\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\" >\n");
      out.write("                        <form id=\"form2\" action=\"forgotPassController\" method=\"POST\">\n");
      out.write("                            ");

                                String WrongEmail = (String) request.getSession().getAttribute("WrongEmail");
                                if (WrongEmail != null) {
                            
      out.write("\n");
      out.write("                            <div class=\"alert alert-warning\" style=\"color: red\">");
      out.print( WrongEmail);
      out.write("</div>\n");
      out.write("                            ");

                                    // Xóa thuộc tính session để tránh hiển thị lại cảnh báo
                                    request.getSession().removeAttribute("WrongEmail");
                                }
                            
      out.write("\n");
      out.write("                            <div class=\"form-row\">                               \n");
      out.write("                                <div class=\"form-group col-sm-7\">\n");
      out.write("\n");
      out.write("                                    <label class=\"sr-only\" for=\"exampleInputEmail3\">Email address</label>\n");
      out.write("                                    <input type=\"email\" name=\"email\" class=\"form-control form-control-sm mr-1\" id=\"exampleInputEmail3\"\n");
      out.write("                                           placeholder=\"Enter email\" required pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$\" title=\"Wrong format email\">\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-row\">\n");
      out.write("                                <select name=\"optionRole\" >\n");
      out.write("                                    <option value=\"optionuser\" >User</option>\n");
      out.write("                                    <option value=\"optionhospital\" >Hospital</option>\n");
      out.write("                                </select>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-secondary btn-sm ml-auto\"\n");
      out.write("                                        data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                                <button type=\"submit\" class=\"btn  btn-sm ml-1\"  style=\"background: linear-gradient(-135deg, #c850c0, #4158d0); color: white;\">Continue</button>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('[data-toggle=\"tooltip\"]').tooltip();\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
