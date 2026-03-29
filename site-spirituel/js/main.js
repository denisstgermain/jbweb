// ============================================
//   JULIE BERGERON — SITE SPIRITUEL — main.js
//   Router domaine + animations + navigation
// ============================================

document.addEventListener('DOMContentLoaded', function () {

  // --- ROUTER DOMAINE ---
  // Detecte le domaine et redirige vers la bonne landing page
  (function () {
    var hostname = window.location.hostname.toLowerCase();
    var page = window.location.pathname.split('/').pop() || 'index.html';

    // Ne router que sur index.html (page d'accueil)
    if (page !== 'index.html' && page !== '') return;

    var routes = {
      'juliebergeron-holistique.com': 'holistique.html',
      'www.juliebergeron-holistique.com': 'holistique.html',
      'juliebergeron-tarologue.com': 'tarologue.html',
      'www.juliebergeron-tarologue.com': 'tarologue.html',
      'juliebergeron-rose-tarologue.com': 'rose-tarologue.html',
      'www.juliebergeron-rose-tarologue.com': 'rose-tarologue.html'
    };

    // Support param ?domain= pour test local
    var params = new URLSearchParams(window.location.search);
    var testDomain = params.get('domain');
    if (testDomain && routes[testDomain]) {
      window.location.replace(routes[testDomain]);
      return;
    }

    if (routes[hostname]) {
      window.location.replace(routes[hostname]);
    }
  })();

  // --- NAVIGATION SCROLL ---
  var nav = document.querySelector('.nav');
  if (nav) {
    window.addEventListener('scroll', function () {
      if (window.scrollY > 40) {
        nav.classList.add('scrolled');
      } else {
        nav.classList.remove('scrolled');
      }
    }, { passive: true });
  }

  // --- MENU HAMBURGER ---
  var toggle = document.querySelector('.nav-toggle');
  var navLinks = document.querySelector('.nav-links');
  if (toggle && navLinks) {
    toggle.addEventListener('click', function () {
      navLinks.classList.toggle('open');
      var isOpen = navLinks.classList.contains('open');
      toggle.setAttribute('aria-expanded', isOpen);
      var spans = toggle.querySelectorAll('span');
      if (isOpen) {
        spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
        spans[1].style.opacity = '0';
        spans[2].style.transform = 'rotate(-45deg) translate(5px, -5px)';
      } else {
        spans[0].style.transform = '';
        spans[1].style.opacity = '';
        spans[2].style.transform = '';
      }
    });

    // Fermer le menu au clic sur un lien
    navLinks.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        navLinks.classList.remove('open');
        var spans = toggle.querySelectorAll('span');
        spans[0].style.transform = '';
        spans[1].style.opacity = '';
        spans[2].style.transform = '';
      });
    });
  }

  // --- LIEN ACTIF NAVIGATION ---
  var currentPage = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a').forEach(function (link) {
    var href = link.getAttribute('href');
    if (!href) return;
    var linkPage = href.split('/').pop();
    if (linkPage === currentPage) {
      link.classList.add('active');
    }
  });

  // --- REVEAL ON SCROLL ---
  var reveals = document.querySelectorAll('.reveal');
  if (reveals.length > 0 && 'IntersectionObserver' in window) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

    reveals.forEach(function (el) {
      observer.observe(el);
    });
  }

  // --- FAQ ACCORDEON ---
  document.querySelectorAll('.faq-question').forEach(function (btn) {
    btn.addEventListener('click', function () {
      var item = btn.closest('.faq-item');
      var wasOpen = item.classList.contains('open');

      // Fermer tous les items
      document.querySelectorAll('.faq-item').forEach(function (i) {
        i.classList.remove('open');
      });

      // Toggle l'item clique
      if (!wasOpen) {
        item.classList.add('open');
      }
    });
  });

  // --- SMOOTH SCROLL pour ancres ---
  document.querySelectorAll('a[href^="#"]').forEach(function (link) {
    link.addEventListener('click', function (e) {
      var target = document.querySelector(link.getAttribute('href'));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });

});
