# Contact Form Setup Guide

## ✅ CONTACT FORM IS NOW LIVE!

Your contact form is configured and ready to receive inquiries!

---

## 🎯 How It Works

**Service Used:** FormSubmit.co (100% Free, No Signup Required)

**Your Contact Email:** snippetandsplotch@gmail.com

### First-Time Activation (ONE TIME ONLY)

**⚠️ IMPORTANT: You must activate the form on first use!**

1. **Go to your website:** https://snippetandsplotch.github.io/
2. **Scroll to Contact section**
3. **Fill out the form yourself** (use any test data)
4. **Click "Send Message"**
5. **Check your email** (snippetandsplotch@gmail.com)
6. **Click the activation link** from FormSubmit

**After activation, the form will work for everyone!**

---

## 📧 What Happens When Someone Submits

1. Visitor fills out your contact form
2. Form sends to FormSubmit.co
3. FormSubmit forwards email to: **snippetandsplotch@gmail.com**
4. Visitor gets redirected back to your site with success message
5. You receive email with:
   - Visitor's name
   - Visitor's email
   - Subject they selected
   - Their message

---

## 🎨 Email Format

You'll receive emails formatted like this:

```
Subject: New inquiry from Snippet and Splotch website

Name: John Doe
Email: john@example.com
Subject: Commission Request
Message: I'd like to commission a custom piece...
```

---

## ✅ Features Enabled

- ✅ **Anti-spam honeypot** (blocks bots)
- ✅ **No CAPTCHA** (better user experience)
- ✅ **Clean email format** (table layout)
- ✅ **Auto-redirect** back to your site
- ✅ **Success message** shown to visitor
- ✅ **Mobile friendly**
- ✅ **100% Free** (unlimited submissions)

---

## 🔧 Advanced Configuration (Optional)

### Change Notification Email

To send to a different email address:

```html
<!-- In index.html, change this line: -->
<form action="https://formsubmit.co/YOUR_NEW_EMAIL@gmail.com" method="POST">
```

### Add Auto-Reply

Add this hidden field to send auto-reply to visitors:

```html
<input type="hidden" name="_autoresponse" value="Thank you for contacting Snippet and Splotch! I'll get back to you within 24 hours.">
```

### Change Success Message

Edit the redirect URL in index.html:

```html
<input type="hidden" name="_next" value="https://snippetandsplotch.github.io/?message=sent">
```

---

## 🐛 Troubleshooting

### Form Not Working?

1. **Did you activate it?** Check email for activation link
2. **Check spam folder** for activation email
3. **Try incognito mode** to test the form
4. **Check browser console** for JavaScript errors

### Not Receiving Emails?

1. **Check spam/junk folder**
2. **Verify email address** in form action
3. **Make sure form is activated**
4. **Try test submission yourself**

### Visitor Doesn't See Success Message?

1. **Clear browser cache**
2. **Check that redirect URL matches your domain**
3. **Look in browser console** for errors

---

## 📊 Monitoring Form Submissions

FormSubmit is email-only. To track submissions:

1. **Create Gmail label** "Website Inquiries"
2. **Set up filter** to auto-label emails from FormSubmit
3. **Check email daily** for new inquiries

**Optional:** Use Google Analytics to track form submissions (we can add this!)

---

## 🚀 Next Steps

1. **Activate the form** (first submission)
2. **Test it yourself** (submit test inquiry)
3. **Verify email arrives** in your inbox
4. **Set up email filters/labels** for organization
5. **Respond to inquiries** within 24 hours!

---

## 💡 Tips for Better Response Rate

1. **Respond quickly** (within 24 hours)
2. **Personalize responses** (use visitor's name)
3. **Ask follow-up questions** (commission details, budget)
4. **Include portfolio link** (link to specific artwork)
5. **Make it easy** (clear next steps, pricing)

---

## 🔄 Alternative Services (If Needed)

If FormSubmit doesn't work for you, alternatives:

1. **Formspree** - formspree.io (50 submissions/month free)
2. **Netlify Forms** - netlify.com (100 submissions/month free)
3. **EmailJS** - emailjs.com (200 emails/month free)
4. **Web3Forms** - web3forms.com (unlimited free)

---

## ✅ You're All Set!

Your contact form is **ready to receive inquiries!**

Just activate it with your first test submission and you'll start receiving leads! 🎉

