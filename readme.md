# اسم المشروع:

Infrastructure as Code (IaC) with Terraform + Terragrunt + CI/CD (GitHub Actions)
## وصف مختصر:

بناء بنية تحتية كاملة على AWS (VPC, subnets, EC2, RDS, S3) باستخدام Terraform و Terragrunt، مع إنشاء pipeline CI/CD عبر GitHub Actions لتطبيق التغييرات تلقائياً بعد كل commit. إضافة ميزة Drift Detection وإرسال تنبيهات إلى Slack.
الأدوات المستخدمة:

- Terraform (مع Terragrunt لتجنب تكرار الكود)

- AWS (VPC, EC2, RDS, S3, IAM)

- GitHub Actions (CI/CD pipeline)

- tflint و checkov (لتحليل جودة الكود وأمانه)

- Slack (إشعارات)

- AWS S3 + DynamoDB (لقفل حالة الـ state)

## المهارات التي تكتسبها (وما سيكتب في سيرتك الذاتية):

- تصميم بنية تحتية قابلة للتكرار عبر بيئات (dev/staging/prod) باستخدام Terragrunt.

- إدارة حالة Terraform عن بُعد (remote state) مع قفل آمن.

- دمج IaC في CI/CD pipeline: terraform plan على Pull Requests، و terraform apply تلقائي عند الدمج على main.

- كشف الانجراف (drift) وجدولته لاكتشاف التغييرات اليدوية.

- تطبيق best practices الأمنية (Checkov) وفحص النمط (tflint) في pipeline.

- توثيق كامل للمشروع على GitHub مع مخططات معماري.
