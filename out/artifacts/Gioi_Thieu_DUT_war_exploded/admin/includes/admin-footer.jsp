<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="admin-footer">
    <div class="admin-footer__content">
        <span>DUT Admin Portal &copy; <%= java.time.Year.now() %></span>
        <span class="admin-footer__links">
            <a href="${pageContext.request.contextPath}/" target="_blank">Xem website</a>
            <span>|</span>
            <a href="mailto:support@dut-demo.local">Hỗ trợ</a>
        </span>
    </div>
</footer>

<style>
.admin-footer {
    margin-top: 2rem;
    padding: 1rem 1.5rem;
    border-top: 1px solid #e0e0e0;
    background: #fff;
    font-size: 0.9rem;
    color: #666;
}
.admin-footer__content {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 0.75rem;
}
.admin-footer__links a {
    color: #005fb7;
    text-decoration: none;
}
.admin-footer__links a:hover {
    text-decoration: underline;
}
</style>

