# Development Guidelines

## Philosophy

### Core Principles
- **Learn from existing code** - Study patterns before implementing new features
- **Incremental progress** - Small, working changes over big rewrites
- **Pragmatic over dogmatic** - Adapt to project reality
- **Clarity over cleverness** - Readable code is maintainable code

### Simplicity
- Single responsibility per component/function
- Avoid premature abstractions
- Choose the boring, proven solution
- If it needs extensive comments to explain, it's too complex

## Technical Standards

### Code Quality
- Write self-documenting code with clear variable names
- Use proper type definitions when working with typed languages
- Include error handling with descriptive messages
- Test critical paths before committing

### Architecture
- Prefer composition over complex inheritance
- Keep components/modules focused and single-purpose
- Make dependencies explicit
- Fail fast with clear error messages

## Project Integration

### Learn the Codebase First
- Find similar components or features as reference
- Identify common patterns and utilities already in use
- Follow existing state management approaches
- Maintain consistency with the project's architecture

### Respect Project Tooling
- Use the project's existing package manager and build tools
- Follow the project's linter and formatter configurations
- Don't introduce new dependencies without strong justification
- Follow the project's testing patterns and frameworks

### Adapt to Project Conventions
- Match existing naming conventions (files, components, variables)
- Follow the project's directory structure and organization
- Use the same libraries/utilities that are already in the codebase
- Maintain consistency with existing code style

## Important Reminders

**NEVER**:
- Bypass linting or type checking to "make it work"
- Commit code that doesn't compile or breaks existing tests
- Disable tests instead of fixing them
- Make assumptions - verify with existing code

**ALWAYS**:
- Check for existing similar implementations before writing new code
- Commit working code incrementally
- Update documentation as you make changes
- Stop after 3 failed attempts and reassess the approach
