[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](<Redirect-URL>)

# InvasivesInspect

This application is for the field-based recording of watercraft inspections for Invasive Mussels in British Columbia, Canada. 

Anyone with a BCeID or idir can log into the application, but only users with the following roles can create and submit entries.

  - Officer Mussel Inspect App
  - Admin Mussel Inspect App
  - Admin

Roles are enforced through Keycloak

## Installation

The application leverages SwiftUI making development simple

1. Clone this [repo](https://github.com/bcgov/invasivesBC-mussels-iOS)

```text
git clone https://github.com/bcgov/invasivesBC-mussels-iOS
```
2. Navigate to project folder in XCode

3. Open Invasives-iOS.xcodeproj in XCode

## Development

This application leverages SwiftUI for development, giving you both access to `Canvas` and the `iOS Simulator`.

- You can run the simulator through the build command
- You can open canvas by opening any `*View` file and selecting `Editor` -> `Canvas` to display previews in XCode
