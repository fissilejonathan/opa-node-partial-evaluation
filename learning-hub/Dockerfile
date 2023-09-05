###################
# BUILD FOR LOCAL DEVELOPMENT
###################

FROM node:18-alpine As development

# Install PNPM globally
RUN npm install -g pnpm

# Create app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND pnpm-lock.yaml (when available).
# Copying this first prevents re-running pnpm install on every code change.
COPY --chown=node:node package*.json pnpm-lock.yaml ./

# Install app dependencies using PNPM
RUN pnpm install

# Bundle app source
COPY --chown=node:node . .

# Use the node user from the image (instead of the root user)
USER node

###################
# BUILD FOR PRODUCTION
###################

FROM node:18-alpine As build

WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND pnpm-lock.yaml (when available).
COPY --chown=node:node package*.json pnpm-lock.yaml ./

# In order to run `pnpm run build`, we need access to the Nest CLI which is a dev dependency.
# In the previous development stage, we ran `pnpm install` which installed all dependencies,
# so we can copy over the node_modules directory from the development image
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules

COPY --chown=node:node . .

# Install PNPM explicitly in the build stage
RUN npm install -g pnpm

# Run the build command which creates the production bundle
RUN pnpm run build

# Set NODE_ENV environment variable
ENV NODE_ENV production

# Running `pnpm install` removes the existing node_modules directory and installs only the production dependencies.
# This ensures that the node_modules directory is as optimized as possible.
RUN pnpm install --prod && pnpm prune

USER node

###################
# PRODUCTION
###################

FROM node:18-alpine As production

# Copy the bundled code from the build stage to the production image
COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

EXPOSE 3000

# Start the server using the production build
CMD [ "node", "dist/main.js" ]
