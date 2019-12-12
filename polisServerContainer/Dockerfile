FROM node:10.9

# For admin functionality, fill this out
ENV ADMIN_EMAILS []
ENV ADMIN_EMAIL_DATA_EXPORT ""
ENV ADMIN_EMAIL_DATA_EXPORT_TEST ""
ENV ADMIN_EMAIL_EMAIL_TEST ""
ENV ADMIN_UIDS []

ENV DATABASE_FOR_READS_NAME DATABASE_URL
ENV DATABASE_URL postgres://postgres:#{db_password}@postgres:5432/polis
ENV DEV_MODE false
ENV DISABLE_INTERCOM true
ENV DOMAIN_OVERRIDE polisserver:5000
ENV PORT 5000
ENV STATIC_FILES_ADMINDASH_PORT 5002
ENV STATIC_FILES_HOST polisclient
ENV STATIC_FILES_PORT 80
ENV STRIPE_SECRET_KEY sk_test_NFBDEThkpHCYBzXPJuBlY8TW

WORKDIR /app

COPY polisServer/package*.json /app/
RUN npm install

COPY polisServer /app/

EXPOSE 5000
CMD node --max_old_space_size=400 --gc_interval=100 --harmony app.js
