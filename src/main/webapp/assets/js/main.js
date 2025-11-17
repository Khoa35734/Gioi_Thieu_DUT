// Main JavaScript for Gioi Thieu DUT Website

document.addEventListener('DOMContentLoaded', function() {
    console.log('Website Giới Thiệu DUT loaded successfully!');

    // Smooth scroll for internal links
    const internalLinks = document.querySelectorAll('a[href^="#"]');
    internalLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Confirm delete actions
    const deleteButtons = document.querySelectorAll('.btn-danger');
    deleteButtons.forEach(button => {
        if (button.textContent.includes('Xóa')) {
            button.addEventListener('click', function(e) {
                if (!confirm('Bạn có chắc chắn muốn xóa?')) {
                    e.preventDefault();
                }
            });
        }
    });
});

// Form validation helper
function validateForm(formId) {
    const form = document.getElementById(formId);
    if (!form) return true;

    const inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
    let isValid = true;

    inputs.forEach(input => {
        if (!input.value.trim()) {
            input.style.borderColor = 'red';
            isValid = false;
        } else {
            input.style.borderColor = '#ddd';
        }
    });

    return isValid;
}

