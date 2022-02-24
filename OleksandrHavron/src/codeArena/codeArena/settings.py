"""
Django settings for codeArena project.
"""

import datetime
from email.policy import default
import os
from datetime import timedelta
from pathlib import Path

from decouple import config


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
MEDIA_URL = '/media/'


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '3izb^ryglj(bvrjb2_y1fZvcnbky#358_l6-nn#i8fkug4mnz!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DEBUG', default=False, cast=bool)

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles', 
    'rest_framework',
    'rest_framework.authtoken',
    'task',
    'competition',
    'user',
    'vacancies',
    'news',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'codeArena.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'codeArena.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

MONGODB_USER = config("MONGODB_USER")
MONGODB_USER_PASS = config("MONGODB_USER_PASS")
MONGODB_HOST = config("MONGODB_HOST")

DATABASES = {

    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': config('DB_NAME'),
        'USER': config('DB_USER'),
        'PASSWORD': config('DB_PASSWORD'),
        'HOST': config('PG_HOST', default='127.0.0.1'),
        'PORT': config('DB_PORT', default=5050, cast=int),
    },
    'mongo':{
        'ENGINE': 'djongo',
        'NAME': 'codearena_mdb',
        'ENFORCE_SCHEMA': False,
        'CLIENT': {
            'host': f'mongodb://{MONGODB_USER}:{MONGODB_USER_PASS}@{MONGODB_HOST}/admin?retryWrites=true&w=majority'
        }

    }

}


# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

AUTH_USER_MODEL = 'user.User'


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


DATABASE_ROUTERS = ['routers.db_routers.PostgresRouter',
                    'routers.db_routers.MongoRouter']


REST_FRAMEWORK = {
  'DEFAULT_AUTHENTICATION_CLASSES': (
    'rest_framework.authentication.TokenAuthentication',
    'rest_framework_simplejwt.authentication.JWTAuthentication',
  ),
}

AUTHENTICATION_BACKENDS = (
    "django.contrib.auth.backends.ModelBackend",
    "djoser.social.backends.facebook.FacebookOAuth2Override",
    "social_core.backends.google.GoogleOAuth2",
)

for key in ['GOOGLE_OAUTH2_KEY',
            'GOOGLE_OAUTH2_SECRET',
            'FACEBOOK_KEY',
            'FACEBOOK_SECRET']:
    exec("SOCIAL_AUTH_{key} = os.environ.get('{key}', '')".format(key=key))

SOCIAL_AUTH_FACEBOOK_SCOPE = ['email']
SOCIAL_AUTH_GOOGLE_OAUTH2_SCOPE = ['email', 'profile']
SOCIAL_AUTH_USERNAME_IS_FULL_EMAIL = True

SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.auth_allowed',
    'social_core.pipeline.social_auth.social_user',
    'social_core.pipeline.user.get_username',
    'social_core.pipeline.social_auth.associate_by_email',  # <- this line not included by default
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'social_core.pipeline.social_auth.load_extra_data',
    'social_core.pipeline.user.user_details',
)

# SOCIAL_AUTH_FACEBOOK_KEY = os.environ.get("FACEBOOK_KEY", "")
# SOCIAL_AUTH_FACEBOOK_SECRET = os.environ.get("FACEBOOK_SECRET", "")

# SOCIAL_AUTH_FACEBOOK_SCOPE = ["email"]
# SOCIAL_AUTH_FACEBOOK_PROFILE_EXTRA_PARAMS = {"fields": "id, name, email"}
# JWT_AUTH = {

#     'JWT_VERIFY': True,
#     'JWT_VERIFY_EXPIRATION': True,
#     'JWT_EXPIRATION_DELTA': datetime.timedelta(days=2),
#     'JWT_AUTH_HEADER_PREFIX': 'Bearer',
#     'JWT_ALLOW_REFRESH': True,
#     'JWT_REFRESH_EXPIRATION_DELTA': datetime.timedelta(days=7),
#     'JWT_SECRET_KEY': config('JWT_SECRET_KEY')

# }
