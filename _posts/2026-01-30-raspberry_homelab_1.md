---
title: Raspberry Homelab - 1
author: quartoxuna
date: 2026-01-30
layout: post
tags: [raspberry]
categories: [homelab]
---

# Problem

Erstellung eines Homelab Servers, auf dem man Technologien und Dienste ausprobieren kann.

# Lösung

- Einen (älteren) Raspberry Pi Model 3 B+ aus dem Keller
- Aktuellen Raspberry OS
- Allen schön im Netzwerk erreichbar

# Was habe ich gelernt?

- Auf dem Raspberry Pi OS läuft der **avahi** Dienst
- Dieser lauscht auf einer Multicase Adresse und antwortet, wenn jemand seinem Namen ruft
- Ergo, ich kann das Gerät direkt per `ping homelab.local` anpingen, egal welche IP Adresse es hätte
- Finde ich sehr praktisch
