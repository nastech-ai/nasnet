FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

COPY public ./public
COPY .next/standalone ./
COPY .next/static ./.next/static

RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

USER nextjs
EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["node", "server.js"]
