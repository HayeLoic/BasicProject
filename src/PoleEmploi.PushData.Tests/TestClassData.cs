using System.Collections.Generic;
using NUnit.Framework;

namespace BasicProject.Tests
{
    public class TestClassData
    {
        public static IEnumerable<TestCaseData> ShouldReturnTestObjectValueMultiplicateByTwo
        {
            get
            {
                yield return new TestCaseData(
                    null,
                    0,
                    true);
                yield return new TestCaseData(
                    null,
                    4,
                    false);
                yield return new TestCaseData(
                    new TestObject
                    {
                        Name = "object 1",
                        Value = 10
                    },
                    20,
                    true);
                yield return new TestCaseData(
                    new TestObject
                    {
                        Name = "object 2",
                        Value = 15
                    },
                    15,
                    false);
            }
        }
    }
}